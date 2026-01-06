import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/presentation/providers/commands_provider.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:intl/intl.dart';
import 'command_detail_page.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedStatus; // null, 'queue', 'sent', 'acked', 'failed'
  Set<String> _selectedDeviceTypes = {};
  bool _sortAscending = false; // false = descending (newest first), true = ascending

  List _filterByDate(List commands) {
    return commands.where((command) {
      // Date range filter
      if (_startDate != null || _endDate != null) {
        final sentAt = command.sentAt;
        if (sentAt == null) return false;

        if (_startDate != null && sentAt.isBefore(_startDate!)) {
          return false;
        }

        if (_endDate != null && sentAt.isAfter(_endDate!)) {
          return false;
        }
      }

      // Status filter
      if (_selectedStatus != null && command.status != _selectedStatus) {
        return false;
      }

      // Device type filter
      if (_selectedDeviceTypes.isNotEmpty) {
        final applianceId = command.applianceId;
        String? deviceType;
        
        if (applianceId is Map<String, dynamic>) {
          deviceType = applianceId['device_type'] as String?;
        }
        
        if (deviceType == null || !_selectedDeviceTypes.contains(deviceType)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  Future<void> _selectStartDate() async {
    final startDate = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: _endDate ?? DateTime.now(),
    );

    if (startDate == null) return;

    final startTime = await showTimePicker(
      context: context,
      initialTime: _startDate != null 
          ? TimeOfDay(hour: _startDate!.hour, minute: _startDate!.minute)
          : const TimeOfDay(hour: 0, minute: 0),
    );

    if (startTime == null) return;

    setState(() {
      _startDate = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
        startTime.hour,
        startTime.minute,
      );
    });
  }

  Future<void> _selectEndDate() async {
    final endDate = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (endDate == null) return;

    final endTime = await showTimePicker(
      context: context,
      initialTime: _endDate != null 
          ? TimeOfDay(hour: _endDate!.hour, minute: _endDate!.minute)
          : const TimeOfDay(hour: 23, minute: 59),
    );

    if (endTime == null) return;

    setState(() {
      _endDate = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        endTime.hour,
        endTime.minute,
      );
    });
  }

  void _clearDateFilter() {
    setState(() {
      _startDate = null;
      _endDate = null;
    });
  }

  void _toggleSort() {
    setState(() {
      _sortAscending = !_sortAscending;
    });
  }

  void _toggleStatusFilter(String status) {
    setState(() {
      if (_selectedStatus == status) {
        _selectedStatus = null;
      } else {
        _selectedStatus = status;
      }
    });
  }

  void _toggleDeviceTypeFilter(String deviceType) {
    setState(() {
      if (_selectedDeviceTypes.contains(deviceType)) {
        _selectedDeviceTypes.remove(deviceType);
      } else {
        _selectedDeviceTypes.add(deviceType);
      }
    });
  }

  Future<void> _showStatusFilterDialog() async {
    final statuses = ['queue', 'sent', 'acked', 'failed'];
    
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter by Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: statuses.map((status) => CheckboxListTile(
            title: Text(status.toUpperCase()),
            value: _selectedStatus == status,
            onChanged: (_) => _toggleStatusFilter(status),
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeviceTypeFilterDialog(List commands) async {
    final deviceTypes = <String>{};
    
    for (final command in commands) {
      final applianceId = command.applianceId;
      if (applianceId is Map<String, dynamic>) {
        final deviceType = applianceId['device_type'] as String?;
        if (deviceType != null) {
          deviceTypes.add(deviceType);
        }
      }
    }

    if (deviceTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No device types available')),
      );
      return;
    }

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter by Device Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: deviceTypes.toList().map((deviceType) => CheckboxListTile(
            title: Text(deviceType),
            value: _selectedDeviceTypes.contains(deviceType),
            onChanged: (_) => _toggleDeviceTypeFilter(deviceType),
          )).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final commandsState = ref.watch(commandsListProvider);
    final allCommandsForFilter = commandsState.maybeWhen(
      data: (commands) => commands,
      orElse: () => [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Command History'),
        actions: [
          if (_startDate != null || _endDate != null || _selectedStatus != null || _selectedDeviceTypes.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () {
                setState(() {
                  _startDate = null;
                  _endDate = null;
                  _selectedStatus = null;
                  _selectedDeviceTypes.clear();
                });
              },
              tooltip: 'Clear all filters',
            ),
          IconButton(
            icon: Icon(_sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
            onPressed: _toggleSort,
            tooltip: _sortAscending ? 'Oldest first' : 'Newest first',
          ),
          IconButton(
            icon: const Icon(Icons.pending),
            onPressed: _showStatusFilterDialog,
            tooltip: 'Filter by status',
          ),
          IconButton(
            icon: const Icon(Icons.device_unknown),
            onPressed: () => _showDeviceTypeFilterDialog(allCommandsForFilter),
            tooltip: 'Filter by device type',
          ),
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _selectStartDate,
            tooltip: 'Select start date',
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month ),
            onPressed: _selectEndDate,
            tooltip: 'Select end date',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(commandsListProvider.notifier).loadCommands(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter indicator
          if (_startDate != null || _endDate != null || _selectedStatus != null || _selectedDeviceTypes.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blue.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.filter_list, size: 16, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text(
                        'Active Filters:',
                        style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      if (_startDate != null)
                        Chip(
                          label: Text('From: ${DateFormat('MMM dd, HH:mm').format(_startDate!)}'),
                          onDeleted: () => setState(() => _startDate = null),
                        ),
                      if (_endDate != null)
                        Chip(
                          label: Text('To: ${DateFormat('MMM dd, HH:mm').format(_endDate!)}'),
                          onDeleted: () => setState(() => _endDate = null),
                        ),
                      if (_selectedStatus != null)
                        Chip(
                          label: Text('Status: $_selectedStatus'),
                          onDeleted: () => setState(() => _selectedStatus = null),
                        ),
                      if (_selectedDeviceTypes.isNotEmpty)
                        Chip(
                          label: Text('Types: ${_selectedDeviceTypes.join(", ")}'),
                          onDeleted: () => setState(() => _selectedDeviceTypes.clear()),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: commandsState.when(
              data: (allCommands) {
                // Filter by date range
                final commands = _filterByDate(allCommands);

                if (commands.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.history, size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(_startDate != null || _endDate != null
                            ? 'No commands in selected date range'
                            : 'No command history'),
                      ],
                    ),
                  );
                }

                // Sort by sentAt
                final sortedCommands = List.from(commands)
                  ..sort((a, b) {
                    final dateA = a.sentAt ?? DateTime.now();
                    final dateB = b.sentAt ?? DateTime.now();
                    return _sortAscending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
                  });

                return RefreshIndicator(
                  onRefresh: () => ref.read(commandsListProvider.notifier).loadCommands(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: sortedCommands.length,
                    itemBuilder: (context, index) {
                      final command = sortedCommands[index];
                      final applianceName = _getApplianceName(command.applianceId);
                      final sentAt = command.sentAt ?? DateTime.now();
                      final formattedDate = DateFormat('MMM dd, HH:mm').format(sentAt);

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getStatusColor(command.status),
                            child: _getStatusIcon(command.status),
                          ),
                          title: Text(applianceName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Action: ${command.action ?? "Unknown"}'),
                              Text(
                                formattedDate,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: _buildStatusBadge(command.status),
                          onTap: () {
                            if (command.id != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CommandDetailPage(commandId: command.id!),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () => const LoadingWidget(message: 'Loading history...'),
              error: (error, stack) => ErrorStateWidget(
                message: error.toString(),
                onRetry: () => ref.read(commandsListProvider.notifier).loadCommands(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getApplianceName(dynamic applianceId) {
    if (applianceId == null) return 'Unknown';
    if (applianceId is String) return 'Unknown';
    if (applianceId is Map<String, dynamic>) {
      return applianceId['name'] ?? 'Unknown';
    }
    return 'Unknown';
  }

  Icon _getStatusIcon(String? status) {
    // Color iconColor = _getStatusColor(status); // Gán màu sắc từ hàm _getStatusColor

    switch (status) {
      case 'queued':
        return Icon(Icons.pending_outlined);
      case 'failed':
        return Icon(Icons.wifi_tethering_error_outlined);
      case 'sent':
        return Icon(Icons.hourglass_empty);
      case 'acked':
        return Icon(Icons.task_alt);
      default:
        return Icon(Icons.help);
    }
  }


  Color _getStatusColor(String? status) {
    switch (status) {
      case 'acked':
        return Colors.green;
      case 'failed':
        return Colors.red;
      case 'sent':
        return Colors.blue;
      case 'queued':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Widget _buildStatusBadge(String? status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status ?? 'Unknown',
        style: TextStyle(
          fontSize: 12,
          color: _getStatusColor(status),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

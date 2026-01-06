import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/data/models/command.dart';

class CommandDetailPage extends ConsumerStatefulWidget {
  final String commandId;

  const CommandDetailPage({super.key, required this.commandId});

  @override
  ConsumerState<CommandDetailPage> createState() => _CommandDetailPageState();
}

class _CommandDetailPageState extends ConsumerState<CommandDetailPage> {
  late Future<Command> _commandFuture;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _loadCommand();
  }

  void _loadCommand() {
    _commandFuture = ref
        .read(commandsRepositoryProvider)
        .getCommandById(widget.commandId);
  }

  Future<void> _resendCommand(Command command) async {
    setState(() {
      _isSending = true;
    });

    try {
      final roomId = _extractId(command.roomId);
      final controllerId = _extractId(command.controllerId);
      final applianceId = _extractId(command.applianceId);
      final irCodeId = _extractId(command.irCodeId);

      if (roomId == null || controllerId == null || applianceId == null) {
        throw Exception('Missing required IDs');
      }

      await ref.read(commandsRepositoryProvider).sendCommand(
            roomId: roomId,
            controllerId: controllerId,
            applianceId: applianceId,
            action: command.action,
            irCodeId: irCodeId,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Command sent successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  String? _extractId(dynamic id) {
    if (id == null) return null;
    if (id is String) return id;
    if (id is Map<String, dynamic>) return id['_id'] ?? id['id'];
    return null;
  }

  String _extractName(dynamic obj, String key) {
    if (obj == null) return 'Unknown';
    if (obj is String) return 'Unknown';
    if (obj is Map<String, dynamic>) return obj[key] ?? 'Unknown';
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Command Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _loadCommand()),
          ),
        ],
      ),
      body: FutureBuilder<Command>(
        future: _commandFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget(message: 'Loading command...');
          }

          if (snapshot.hasError) {
            return ErrorStateWidget(
              message: snapshot.error.toString(),
              onRetry: () => setState(() => _loadCommand()),
            );
          }

          final command = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Command Info Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Command Information',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Command ID', command.id ?? 'Unknown'),
                        _buildInfoRow('Action', command.action),
                        _buildInfoRow('Status', command.status),
                        if (command.error != null)
                          _buildInfoRow('Error', command.error!),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Appliance Info Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Appliance',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Name', _extractName(command.applianceId, 'name')),
                        _buildInfoRow('Brand', _extractName(command.applianceId, 'brand')),
                        _buildInfoRow('Type', _extractName(command.applianceId, 'device_type')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Room & Controller Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Location',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Room', _extractName(command.roomId, 'name')),
                        _buildInfoRow('Controller', _extractName(command.controllerId, 'name')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Timestamps Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Timestamps',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        if (command.createdAt != null)
                          _buildInfoRow(
                            'Created',
                            DateFormat('yyyy-MM-dd HH:mm:ss').format(command.createdAt!),
                          ),
                        if (command.sentAt != null)
                          _buildInfoRow(
                            'Sent',
                            DateFormat('yyyy-MM-dd HH:mm:ss').format(command.sentAt!),
                          ),
                        if (command.ackAt != null)
                          _buildInfoRow(
                            'Acknowledged',
                            DateFormat('yyyy-MM-dd HH:mm:ss').format(command.ackAt!),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // IR Code Info Card
                if (command.irCodeId != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'IR Code',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow('Action', _extractName(command.irCodeId, 'action')),
                          _buildInfoRow('Protocol', _extractName(command.irCodeId, 'protocol')),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),

                // Resend Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _isSending ? null : () => _resendCommand(command),
                    icon: _isSending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send),
                    label: Text(_isSending ? 'Sending...' : 'Resend Command'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/data/models/appliance.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/presentation/dialogs/appliance_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/appliance_form_data.dart';
import 'package:flutter_application_1/presentation/dialogs/confirm_delete_dialog.dart';


class ApplianceDetailPage extends ConsumerStatefulWidget {
  final Appliance appliance;

  const ApplianceDetailPage({super.key, required this.appliance});

  @override
  ConsumerState<ApplianceDetailPage> createState() => _ApplianceDetailPageState();
}

class _ApplianceDetailPageState extends ConsumerState<ApplianceDetailPage> {
  @override
  Widget build(BuildContext context) {
    final type = widget.appliance.deviceType;
    final brand = widget.appliance.brand;

    if (type == null || brand == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.appliance.name)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Missing device type or brand for ${widget.appliance.name}'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appliance.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _showEditDialog,
            tooltip: 'Edit',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _confirmDelete,
            tooltip: 'Delete',
            color: Colors.red,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showApplianceInfo(context),
            tooltip: 'Appliance Info',
          ),
        ],
      ),
      body: FutureBuilder(
        future: ref.read(irCodesRepositoryProvider).getActions(
              type: type,
              brand: brand,
            ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget(message: 'Loading actions...');
          }

          if (snapshot.hasError) {
            return ErrorStateWidget(
              message: snapshot.error.toString(),
              onRetry: () {
                setState(() {});
              },
            );
          }

          final irCodes = snapshot.data ?? [];

          if (irCodes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.devices_other, size: 48, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No actions available for this appliance'),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: irCodes.length,
            itemBuilder: (context, index) {
              final irCode = irCodes[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.send),
                  title: Text(irCode.action),
                  subtitle: Text('${irCode.brand} • ${irCode.protocol}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _sendCommand(context, irCode.action, irCode.id),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showApplianceInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Appliance Information'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInfoRow('Name', widget.appliance.name),
              const SizedBox(height: 12),
              _buildInfoRow('Brand', widget.appliance.brand ?? 'Unknown'),
              const SizedBox(height: 12),
              _buildInfoRow('Device Type', widget.appliance.deviceType ?? 'Unknown'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Future<void> _sendCommand(
    BuildContext context,
    String action,
    String? irCodeId,
  ) async {
    if (irCodeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('IR Code ID is missing')),
      );
      return;
    }

    final controllerId = _resolveId(widget.appliance.controllerId);
    if (controllerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Controller ID is missing')),
      );
      return;
    }

    try {
      final command = await ref.read(commandsRepositoryProvider).sendCommand(
            roomId: _resolveId(widget.appliance.roomId) ?? '',
            controllerId: controllerId,
            applianceId: widget.appliance.id!,
            action: action,
            irCodeId: irCodeId,
          );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sent "$action" (status: ${command.status})'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String? _resolveId(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map<String, dynamic>) {
      return value['_id'] as String? ?? value['id'] as String?;
    }
    return null;
  }

  Future<void> _showEditDialog() async {
    final result = await showApplianceFormDialog(
      context: context,
      ref: ref,
      title: 'Edit Appliance',
      roomId: _resolveId(widget.appliance.roomId)!,
      initialData: ApplianceFormData(
        name: widget.appliance.name,
        deviceType: widget.appliance.deviceType,
        brand: widget.appliance.brand,
        controllerId: _resolveId(widget.appliance.controllerId),
      ),
    );

    if (result == null) return;

    await ref.read(appliancesRepositoryProvider).updateAppliance(
          id: widget.appliance.id!,
          name: result.name,
          deviceType: result.deviceType,
          brand: result.brand,
          controllerId: result.controllerId,
        );

    Navigator.pop(context);
  }


  Future<void> _confirmDelete() async {
    final confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Delete Appliance',
      content: 'Are you sure you want to delete "${widget.appliance.name}"?',
    );

    if (!confirmed) return;

    try {
      await ref.read(appliancesRepositoryProvider)
          .deleteAppliance(widget.appliance.id!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appliance deleted successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

}

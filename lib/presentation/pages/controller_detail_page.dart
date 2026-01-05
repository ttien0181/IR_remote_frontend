import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/data/models/controller.dart';
import 'package:flutter_application_1/presentation/providers/controllers_provider.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/presentation/widgets/appliance_list_section.dart';
import 'package:flutter_application_1/presentation/dialogs/appliance_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/appliance_form_data.dart';
import 'package:flutter_application_1/presentation/dialogs/controller_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/controller_form_data.dart';
import 'package:flutter_application_1/presentation/dialogs/confirm_delete_dialog.dart';
import 'appliance_detail_page.dart';


class ControllerDetailPage extends ConsumerStatefulWidget {
  final Controller controller;

  const ControllerDetailPage({super.key, required this.controller});

  @override
  ConsumerState<ControllerDetailPage> createState() => _ControllerDetailPageState();
}

class _ControllerDetailPageState extends ConsumerState<ControllerDetailPage> {
  late Future<List> _appliancesFuture;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadAppliances();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadAppliances() {
    _appliancesFuture = ref
        .read(controllerAppliancesRepositoryProvider)
        .getAppliancesByController(controllerId: widget.controller.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.controller.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _showEditDialog
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _confirmDelete,
            color: Colors.red,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _loadAppliances();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: _appliancesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget(message: 'Loading appliances...');
          }

          if (snapshot.hasError) {
            return ErrorStateWidget(
              message: snapshot.error.toString(),
              onRetry: () {
                setState(() {
                  _loadAppliances();
                });
              },
            );
          }

          final appliances = snapshot.data ?? [];

          return SingleChildScrollView(
            child: Column(
              children: [
                // Info card
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Controller Info',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                            const Icon(Icons.router, size: 32, color: Colors.red),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ${widget.controller.name}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Room: ${_getRoomName(widget.controller.roomId)}'),
                        ],
                      ),
                    ),
                  ),
                ),

                // Appliances count card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.devices, size: 32, color: Colors.blue),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Appliances',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${appliances.length}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Search bar for appliances
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ApplianceListSection(
                    appliances: appliances,

                    // ADD
                    onAdd: _showAddApplianceDialog,

                    // EDIT
                    onEdit: _showEditApplianceDialog,

                    // DELETE
                    onDelete: _confirmDeleteAppliance,
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }

  String _getRoomName(dynamic roomId) {
    if (roomId == null) return 'Unknown';
    if (roomId is String) return 'Unknown';
    if (roomId is Map<String, dynamic>) {
      return roomId['name'] ?? 'Unknown';
    }
    return 'Unknown';
  }

  Future<void> _showEditDialog() async {
    final result = await showControllerFormDialog(
      context: context,
      title: 'Edit Controller',
      initialData: ControllerFormData(
        name: widget.controller.name,
        description: widget.controller.description,
      ),
    );

    if (result == null) return;

    try {
      await ref.read(controllersListProvider.notifier).updateController(
            id: widget.controller.id!,
            name: result.name,
            description: result.description,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Controller updated successfully')),
        );
        Navigator.pop(context); // Return to previous page
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Delete Controller',
      content: 'Are you sure you want to delete "${widget.controller.name}"?',
    );

    if (!confirmed) return;

    try {
      await ref.read(controllersListProvider.notifier).deleteController(widget.controller.id!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Controller deleted successfully')),
        );
        Navigator.pop(context); // Return to previous page
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _showAddApplianceDialog() async {
    // Get room ID from controller
    final roomId = _extractId(widget.controller.roomId);
    if (roomId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cannot add appliance: Controller has no room assigned'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    final result = await showApplianceFormDialog(
      context: context,
      ref: ref,
      title: 'Add Appliance',
      roomId: roomId,
    );

    if (result == null) return;

    try {
      await ref.read(appliancesRepositoryProvider).createAppliance(
            name: result.name,
            deviceType: result.deviceType!,
            brand: result.brand!,
            roomId: result.roomId!,
            controllerId: result.controllerId!,
          );

      setState(_loadAppliances);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appliance added successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _showEditApplianceDialog(appliance) async {
    final roomId = _extractId(widget.controller.roomId);
    if (roomId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cannot edit appliance: Controller has no room assigned'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    final result = await showApplianceFormDialog(
      context: context,
      ref: ref,
      title: 'Edit Appliance',
      roomId: roomId,
      initialData: ApplianceFormData(
        name: appliance.name,
        deviceType: appliance.deviceType,
        brand: appliance.brand,
        controllerId: _extractId(appliance.controllerId),
      ),
    );

    if (result == null) return;

    try {
      await ref.read(appliancesRepositoryProvider).updateAppliance(
            id: appliance.id!,
            name: result.name,
            deviceType: result.deviceType,
            brand: result.brand,
            roomId: result.roomId,
            controllerId: result.controllerId,
          );

      setState(_loadAppliances);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appliance updated successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _confirmDeleteAppliance(appliance) async {
    final confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Delete Appliance',
      content: 'Are you sure you want to delete "${appliance.name}"?',
    );

    if (!confirmed) return;

    try {
      await ref.read(appliancesRepositoryProvider).deleteAppliance(appliance.id!);
      setState(_loadAppliances);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appliance deleted successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  String? _extractId(dynamic id) {
    if (id == null) return null;
    if (id is String) return id;
    if (id is Map<String, dynamic>) return id['_id'] ?? id['id'];
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/data/models/room.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/data/models/room_detail_data.dart';
import 'package:flutter_application_1/presentation/widgets/appliance_list_section.dart';
import 'package:flutter_application_1/presentation/dialogs/appliance_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/appliance_form_data.dart';
import 'package:flutter_application_1/presentation/dialogs/room_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/room_form_data.dart';
import 'package:flutter_application_1/presentation/providers/rooms_provider.dart';
import 'package:flutter_application_1/presentation/dialogs/confirm_delete_dialog.dart';
import 'room_info_page.dart';

class RoomDetailPage extends ConsumerStatefulWidget {
  final Room room;

  const RoomDetailPage({super.key, required this.room});

  @override
  ConsumerState<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends ConsumerState<RoomDetailPage> {
  late Future<RoomDetailData> _roomDataFuture;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadRoomData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadRoomData() {
    _roomDataFuture = _fetchRoomData();
  }

  Future<RoomDetailData> _fetchRoomData() async {
    final controllersRepo = ref.read(roomControllersRepositoryProvider);
    final appliancesRepo = ref.read(roomAppliancesRepositoryProvider);

    final controllers =
        await controllersRepo.getControllersByRoom(roomId: widget.room.id!);

    final appliances =
        await appliancesRepo.getAppliancesByRoom(roomId: widget.room.id!);

    return RoomDetailData(
      controllers: controllers,
      appliances: appliances,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _showEditRoomDialog,
            tooltip: 'Edit Room',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _confirmDeleteRoom,
            tooltip: 'Delete Room',
            color: Colors.red,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RoomInfoPage(room: widget.room),
                ),
              );
            },
            tooltip: 'Room Info',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _loadRoomData();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<RoomDetailData>(
        future: _roomDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget(message: 'Loading room data...');
          }

          if (snapshot.hasError) {
            return ErrorStateWidget(
              message: snapshot.error.toString(),
              onRetry: () {
                setState(() {
                  _loadRoomData();
                });
              },
            );
          }


          final roomData = snapshot.data!;
          final controllers = roomData.controllers;
          final appliances = roomData.appliances;


          return SingleChildScrollView(
            child: Column(
              children: [
                // Info cards
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const Icon(Icons.router, size: 32, color: Colors.blue),
                                const SizedBox(height: 8),
                                Text(
                                  '${controllers.length}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Controllers'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const Icon(Icons.devices, size: 32, color: Colors.green),
                                const SizedBox(height: 8),
                                Text(
                                  '${appliances.length}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('Appliances'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

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

  // String _getControllerName(dynamic controllerId) {
  //   if (controllerId == null) return 'Unknown';
  //   if (controllerId is String) return 'Unknown';
  //   if (controllerId is Map<String, dynamic>) {
  //     return controllerId['name'] ?? 'Unknown';
  //   }
  //   return 'Unknown';
  // }

  Future<void> _showAddApplianceDialog() async {
    final result = await showApplianceFormDialog(
      context: context,
      ref: ref,
      title: 'Add Appliance',
      roomId: widget.room.id!,
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

      setState(_loadRoomData);
    } catch (e) {
      showAppError(context, e);
    }
  }


  Future<void> _showEditApplianceDialog(appliance) async {
    final result = await showApplianceFormDialog(
      context: context,
      ref: ref,
      title: 'Edit Appliance',
      roomId: widget.room.id!,
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

      setState(_loadRoomData);
    } catch (e) {
      showAppError(context, e);
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
      setState(_loadRoomData);

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

  Future<void> _showEditRoomDialog() async {
    final result = await showRoomFormDialog(
      context: context,
      title: 'Edit Room',
      initialData: RoomFormData(
        name: widget.room.name,
        description: widget.room.description,
      ),
    );

    if (result == null) return;

    try {
      await ref.read(roomsListProvider.notifier).updateRoom(
            id: widget.room.id!,
            name: result.name,
            description: result.description,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room updated successfully')),
        );
        Navigator.pop(context); // Return to previous page
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _confirmDeleteRoom() async {
    final confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Delete Room',
      content: 'Are you sure you want to delete "${widget.room.name}"?',
    );

    if (!confirmed) return;

    try {
      await ref.read(roomsListProvider.notifier).deleteRoom(widget.room.id!);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room deleted successfully')),
        );
        Navigator.pop(context); // Return to previous page
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }
}

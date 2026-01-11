import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/presentation/providers/rooms_provider.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/empty_state_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/presentation/dialogs/room_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/room_form_data.dart';
import 'package:flutter_application_1/presentation/dialogs/confirm_delete_dialog.dart';
import 'room_detail_page.dart';

class RoomsPage extends ConsumerStatefulWidget {
  const RoomsPage({super.key});

  @override
  ConsumerState<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends ConsumerState<RoomsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roomsState = ref.watch(roomsListProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Rooms'),
      //   // actions: [
      //   //   IconButton(
      //   //     icon: const Icon(Icons.refresh),
      //   //     onPressed: () => ref.read(roomsListProvider.notifier).loadRooms(),
      //   //   ),
      //   // ],
      // ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search rooms by name...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          // Rooms list
          Expanded(
            child: roomsState.when(
              data: (allRooms) {
                // Filter rooms by search query
                final rooms = _searchQuery.isEmpty
                    ? allRooms
                    : allRooms.where((room) {
                        return room.name.toLowerCase().contains(_searchQuery);
                      }).toList();

                if (rooms.isEmpty) {
                  return EmptyStateWidget(
                    message: _searchQuery.isEmpty ? 'No rooms yet' : 'No rooms match your search',
                    icon: Icons.meeting_room_outlined,
                    actionLabel: _searchQuery.isEmpty ? 'Add Room' : null,
                    onAction: _searchQuery.isEmpty ? () => _showAddRoomDialog() : null,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref.read(roomsListProvider.notifier).loadRooms(),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getGridColumns(MediaQuery.of(context).size.width),
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      final room = rooms[index];
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RoomDetailPage(room: room),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Avatar + Menu hàng trên
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      child: Icon(Icons.meeting_room_rounded),
                                    ),
                                    const Spacer(),
                                    PopupMenuButton(
                                      itemBuilder: (context) => const [
                                        PopupMenuItem(value: 'edit', child: Text('Edit')),
                                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                                      ],
                                      onSelected: (value) {
                                        if (value == 'edit') {
                                          _showEditRoomDialog(room);
                                        } else if (value == 'delete') {
                                          _deleteRoom(room);
                                        }
                                      },
                                    ),
                                  ],
                                ),

                                // Tên phòng
                                const SizedBox(height: 12),
                                Text(
                                  room.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),

                                // Mô tả
                                if (room.description != null && room.description!.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  Text(
                                    room.description!,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () => const LoadingWidget(message: 'Loading rooms...'),
              error: (error, stack) => ErrorStateWidget(
                message: error.toString(),
                onRetry: () => ref.read(roomsListProvider.notifier).loadRooms(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddRoomDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddRoomDialog() async {
    final result = await showRoomFormDialog(
      context: context,
      title: 'Add Room',
    );

    if (result == null) return;

    try {
      await ref.read(roomsListProvider.notifier).createRoom(
            name: result.name,
            description: result.description,
          );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room created successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _showEditRoomDialog(room) async {
    final result = await showRoomFormDialog(
      context: context,
      title: 'Edit Room',
      initialData: RoomFormData(
        name: room.name,
        description: room.description,
      ),
    );

    if (result == null) return;

    try {
      await ref.read(roomsListProvider.notifier).updateRoom(
            id: room.id!,
            name: result.name,
            description: result.description,
          );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room updated successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _deleteRoom(room) async {
    final confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Delete Room',
      content: 'Are you sure you want to delete "${room.name}"?',
    );

    if (!confirmed) return;

    try {
      await ref.read(roomsListProvider.notifier).deleteRoom(room.id!);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Room deleted successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showAppError(context, e);
      }
    }
  }

  int _getGridColumns(double width) {
    if (width < 600) {
      return 2; // Phones
    } else if (width < 1200) {
      return 3; // Tablets
    } else {
      return 4; // Desktop
    }
  }
}

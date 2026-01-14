import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/presentation/providers/controllers_provider.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'package:flutter_application_1/presentation/widgets/loading_widget.dart';
import 'package:flutter_application_1/presentation/widgets/error_state_widget.dart';
import 'package:flutter_application_1/presentation/dialogs/controller_form_dialog.dart';
import 'package:flutter_application_1/presentation/dialogs/controller_form_data.dart';
import 'package:flutter_application_1/presentation/dialogs/confirm_delete_dialog.dart';
import 'controller_detail_page.dart';

class ControllersPage extends ConsumerStatefulWidget {
  const ControllersPage({super.key});

  @override
  ConsumerState<ControllersPage> createState() => _ControllersPageState();
}

class _ControllersPageState extends ConsumerState<ControllersPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllersState = ref.watch(controllersListProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Controllers'),
      //   // actions: [
      //   //   IconButton(
      //   //     icon: const Icon(Icons.refresh),
      //   //     onPressed: () => ref.read(controllersListProvider.notifier).loadControllers(),
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
                hintText: 'Search controllers by name...',
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
          // Controller list
          Expanded(
            child: controllersState.when(
              data: (controllers) {
                final filteredControllers = _searchQuery.isEmpty
                    ? controllers
                    : controllers.where((controller) {
                        return controller.name.toLowerCase().contains(_searchQuery);
                      }).toList();

                if (filteredControllers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.router_outlined, size: 48, color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(_searchQuery.isEmpty 
                            ? 'No controllers found'
                            : 'No controllers match your search'),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref.read(controllersListProvider.notifier).loadControllers(),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getGridColumns(MediaQuery.of(context).size.width),
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: filteredControllers.length,
                    itemBuilder: (context, index) {
                      final controller = filteredControllers[index];
                      final roomName = _getRoomName(controller.roomId);
                      final colorScheme = Theme.of(context).colorScheme;
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ControllerDetailPage(controller: controller),
                              ),
                            ).then((_) {
                              ref.read(controllersListProvider.notifier).loadControllers();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: colorScheme.secondaryContainer,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Icon(
                                        Icons.router_rounded,
                                        color: colorScheme.onSecondaryContainer,
                                        size: 32,
                                      ),
                                    ),
                                    const Spacer(),
                                    PopupMenuButton(
                                      itemBuilder: (context) => const [
                                        PopupMenuItem(value: 'edit', child: Text('Edit')),
                                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                                      ],
                                      onSelected: (value) {
                                        if (value == 'edit') {
                                          _showEditDialog(controller);
                                        } else if (value == 'delete') {
                                          _confirmDelete(controller);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  controller.name,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Room: $roomName',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurface,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                  ),
                );
              },
              loading: () => const LoadingWidget(message: 'Loading controllers...'),
              error: (error, stack) => ErrorStateWidget(
                message: error.toString(),
                onRetry: () => ref.read(controllersListProvider.notifier).loadControllers(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        elevation: 4,
        child: const Icon(Icons.add),
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

  Future<void> _showAddDialog() async {
    final result = await showControllerFormDialog(
      context: context,
      title: 'Add Controller',
      ref: ref,
    );

    if (result == null) return;

    try {
      await ref.read(controllersListProvider.notifier).createController(
            name: result.name,
            description: result.description,
            roomId: result.roomId,
          );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Controller created successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _showEditDialog(controller) async {
    final roomId = controller.roomId is String ? controller.roomId : (controller.roomId as Map?)?['_id'] ?? (controller.roomId as Map?)?['id'];
    
    final result = await showControllerFormDialog(
      context: context,
      title: 'Edit Controller',
      ref: ref,
      initialData: ControllerFormData(
        name: controller.name,
        description: controller.description,
        roomId: roomId,
      ),
    );

    if (result == null) return;

    try {
      await ref.read(controllersListProvider.notifier).updateController(
            id: controller.id!,
            name: result.name,
            description: result.description,
            roomId: result.roomId,
          );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Controller updated successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showAppError(context, e);
      }
    }
  }

  Future<void> _confirmDelete(controller) async {
    final confirmed = await showConfirmDeleteDialog(
      context: context,
      title: 'Delete Controller',
      content: 'Are you sure you want to delete "${controller.name}"?',
    );

    if (!confirmed) return;

    try {
      await ref.read(controllersListProvider.notifier).deleteController(controller.id!);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Controller deleted successfully')),
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

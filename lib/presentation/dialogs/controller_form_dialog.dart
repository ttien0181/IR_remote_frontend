import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/presentation/providers/rooms_provider.dart';
import 'controller_form_data.dart';

Future<ControllerFormData?> showControllerFormDialog({
  required BuildContext context,
  required String title,
  required WidgetRef ref,
  ControllerFormData? initialData,
}) async {
  final nameController = TextEditingController(text: initialData?.name ?? '');
  final descriptionController = TextEditingController(text: initialData?.description ?? '');
  String? selectedRoomId = initialData?.roomId;

  return showDialog<ControllerFormData>(
    context: context,
    builder: (context) => _ControllerFormDialogContent(
      title: title,
      initialData: initialData,
      nameController: nameController,
      descriptionController: descriptionController,
      selectedRoomId: selectedRoomId,
      ref: ref,
      onSave: () {
        final colorScheme = Theme.of(context).colorScheme;
        
        if (nameController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Please enter a controller name.'),
              backgroundColor: colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }

        if (selectedRoomId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Please select a room.'),
              backgroundColor: colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }

        Navigator.pop(
          context,
          ControllerFormData(
            name: nameController.text.trim(),
            description: descriptionController.text.trim().isEmpty
                ? null
                : descriptionController.text.trim(),
            roomId: selectedRoomId,
          ),
        );
      },
      onRoomChanged: (roomId) {
        selectedRoomId = roomId;
      },
    ),
  );
}

class _ControllerFormDialogContent extends ConsumerWidget {
  final String title;
  final ControllerFormData? initialData;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final String? selectedRoomId;
  final WidgetRef ref;
  final VoidCallback onSave;
  final Function(String?) onRoomChanged;

  const _ControllerFormDialogContent({
    required this.title,
    this.initialData,
    required this.nameController,
    required this.descriptionController,
    required this.selectedRoomId,
    required this.ref,
    required this.onSave,
    required this.onRoomChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsState = ref.watch(roomsListProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name *',
                prefixIcon: Icon(Icons.router_rounded),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                prefixIcon: Icon(Icons.notes_rounded),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            roomsState.when(
              data: (rooms) {
                return DropdownButtonFormField<String>(
                  value: selectedRoomId,
                  decoration: const InputDecoration(
                    labelText: 'Room *',
                    prefixIcon: Icon(Icons.meeting_room_rounded),
                  ),
                  items: rooms.map((room) {
                    return DropdownMenuItem(
                      value: room.id,
                      child: Text(room.name),
                    );
                  }).toList(),
                  onChanged: initialData == null ? (value) {
                    onRoomChanged(value);
                  } : null,
                  disabledHint: selectedRoomId != null
                      ? Text(rooms.firstWhere((r) => r.id == selectedRoomId, orElse: () => rooms.first).name)
                      : const Text('Select a room'),
                  hint: const Text('Select a room'),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Error loading rooms: $error'),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: onSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}

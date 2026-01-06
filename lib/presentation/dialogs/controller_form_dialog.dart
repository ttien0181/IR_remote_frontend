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
      nameController: nameController,
      descriptionController: descriptionController,
      selectedRoomId: selectedRoomId,
      ref: ref,
      onSave: () {
        if (nameController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please enter a controller name.'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        if (selectedRoomId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a room.'),
              backgroundColor: Colors.red,
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
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final String? selectedRoomId;
  final WidgetRef ref;
  final VoidCallback onSave;
  final Function(String?) onRoomChanged;

  const _ControllerFormDialogContent({
    required this.title,
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
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
                  ),
                  items: rooms.map((room) {
                    return DropdownMenuItem(
                      value: room.id,
                      child: Text(room.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    onRoomChanged(value);
                  },
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
        ElevatedButton(
          onPressed: onSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}

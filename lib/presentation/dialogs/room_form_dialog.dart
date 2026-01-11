import 'package:flutter/material.dart';
import 'room_form_data.dart';

Future<RoomFormData?> showRoomFormDialog({
  required BuildContext context,
  required String title,
  RoomFormData? initialData,
}) async {
  final nameController = TextEditingController(text: initialData?.name ?? '');
  final descriptionController = TextEditingController(text: initialData?.description ?? '');

  return showDialog<RoomFormData>(
    context: context,
    builder: (context) {
      final colorScheme = Theme.of(context).colorScheme;
      
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name *',
                prefixIcon: Icon(Icons.label_outline_rounded),
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
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Please enter a room name.'),
                    backgroundColor: colorScheme.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }

              Navigator.pop(
                context,
                RoomFormData(
                  name: nameController.text.trim(),
                  description: descriptionController.text.trim().isEmpty
                      ? null
                      : descriptionController.text.trim(),
                ),
              );
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

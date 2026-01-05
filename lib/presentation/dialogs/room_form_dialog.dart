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
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Column(
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
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (nameController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a room name.'),
                  backgroundColor: Colors.red,
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
    ),
  );
}

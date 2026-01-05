import 'package:flutter/material.dart';
import 'controller_form_data.dart';

Future<ControllerFormData?> showControllerFormDialog({
  required BuildContext context,
  required String title,
  ControllerFormData? initialData,
}) async {
  final nameController = TextEditingController(text: initialData?.name ?? '');
  final descriptionController = TextEditingController(text: initialData?.description ?? '');

  return showDialog<ControllerFormData>(
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
                  content: Text('Please enter a controller name.'),
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
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}

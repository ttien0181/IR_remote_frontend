import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/providers.dart';
import 'appliance_form_data.dart';

Future<ApplianceFormData?> showApplianceFormDialog({
  required BuildContext context,
  required WidgetRef ref,
  required String title,
  ApplianceFormData? initialData,
  required String roomId,
}) async {
  final nameController = TextEditingController(text: initialData?.name ?? '');
  String? selectedBrand = initialData?.brand;
  String? selectedDeviceType = initialData?.deviceType;
  String? selectedControllerId = initialData?.controllerId;

  // Danh sách Brand và Device Type cho trước
  List<String> brands = ['Sony', 'Daikin', 'Toshiba', 'Samsung'];
  List<String> deviceTypes = ['TV', 'Air Conditioner', 'Fan'];

  List<Controller> controllers = [];
  try {
    controllers = await ref.read(controllersRepositoryProvider).getControllers();
  } catch (_) {
    return null;
  }

  return showDialog<ApplianceFormData>(
    context: context,
    builder: (context) {
      final colorScheme = Theme.of(context).colorScheme;
      
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name field (text input)
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name *',
                    prefixIcon: Icon(Icons.devices_rounded),
                  ),
                ),
                const SizedBox(height: 16),

                // Device Type dropdown
                DropdownButtonFormField<String>(
                  value: selectedDeviceType,
                  decoration: const InputDecoration(
                    labelText: 'Device Type *',
                    prefixIcon: Icon(Icons.category_rounded),
                  ),
                  items: deviceTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDeviceType = value;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Brand dropdown
                DropdownButtonFormField<String>(
                  value: selectedBrand,
                  decoration: const InputDecoration(
                    labelText: 'Brand *',
                    prefixIcon: Icon(Icons.business_rounded),
                  ),
                  items: brands.map((brand) {
                    return DropdownMenuItem<String>(
                      value: brand,
                      child: Text(brand),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBrand = value;
                  });
                },
              ),
                const SizedBox(height: 16),

                // Controller dropdown
                DropdownButtonFormField<String>(
                  value: selectedControllerId,
                  decoration: const InputDecoration(
                    labelText: 'Controller',
                    prefixIcon: Icon(Icons.router_rounded),
                  ),
                  items: controllers.map((c) {
                    return DropdownMenuItem<String>(
                      value: c.id,
                      child: Text(c.name),
                    );
                  }).toList(),
                  onChanged: initialData == null ? (value) {
                    setState(() {
                      selectedControllerId = value;
                    });
                  } : null,
                  disabledHint: selectedControllerId != null
                      ? Text(controllers.firstWhere((c) => c.id == selectedControllerId, orElse: () => controllers.first).name)
                      : const Text('Select a controller'),
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
              onPressed: () {
                // Kiểm tra nếu tên, loại thiết bị, và thương hiệu không trống
                if (nameController.text.trim().isEmpty ||
                    selectedBrand == null ||
                    selectedDeviceType == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Please fill in all required fields.'),
                      backgroundColor: colorScheme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  return;
                }

                Navigator.pop(
                  context,
                  ApplianceFormData(
                    name: nameController.text.trim(),
                    deviceType: selectedDeviceType,
                    brand: selectedBrand,
                    roomId: roomId,
                    controllerId: selectedControllerId,
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      );
    },
  );
}


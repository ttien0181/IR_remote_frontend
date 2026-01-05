import 'package:flutter/material.dart';
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

  List<dynamic> controllers = [];
  try {
    controllers = await ref.read(controllersRepositoryProvider).getControllers();
  } catch (_) {
    return null;
  }

  return showDialog<ApplianceFormData>(
    context: context,
    builder: (context) => StatefulBuilder(
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
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Device Type dropdown
              DropdownButtonFormField<String>(
                value: selectedDeviceType,
                decoration: const InputDecoration(
                  labelText: 'Device Type',
                  border: OutlineInputBorder(),
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
                  labelText: 'Brand',
                  border: OutlineInputBorder(),
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
                  border: OutlineInputBorder(),
                ),
                items: controllers.map((c) {
                  return DropdownMenuItem<String>(
                    value: c.id,
                    child: Text(c.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedControllerId = value;
                  });
                },
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
            onPressed: () {
              // Kiểm tra nếu tên, loại thiết bị, và thương hiệu không trống
              if (nameController.text.trim().isEmpty ||
                  selectedBrand == null ||
                  selectedDeviceType == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill in all required fields.'),
                    backgroundColor: Colors.red,
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
    ),
  );
}


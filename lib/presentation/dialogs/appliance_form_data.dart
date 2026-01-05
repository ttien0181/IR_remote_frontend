class ApplianceFormData {
  final String name;
  final String? deviceType;
  final String? brand;
  final String? roomId;
  final String? controllerId;

  ApplianceFormData({
    required this.name,
    this.deviceType,
    this.brand,
    this.roomId,
    this.controllerId,
  });
}

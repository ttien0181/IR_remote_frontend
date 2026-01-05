import '../../data/models/appliance.dart';
import '../../data/models/controller.dart';

class RoomDetailData {
  final List<Controller> controllers;
  final List<Appliance> appliances;

  RoomDetailData({
    required this.controllers,
    required this.appliances,
  });
}

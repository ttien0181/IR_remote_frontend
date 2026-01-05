import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/data/models/appliance.dart';

final appliancesListProvider = StateNotifierProvider<AppliancesNotifier, AsyncValue<List<Appliance>>>((ref) {
  return AppliancesNotifier(ref);
});

class AppliancesNotifier extends StateNotifier<AsyncValue<List<Appliance>>> {
  final Ref ref;
  
  AppliancesNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAppliances();
  }

  Future<void> loadAppliances({String? roomId, String? controllerId, String? type}) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(appliancesRepositoryProvider);
      final appliances = await repository.getAppliances(
        roomId: roomId,
        controllerId: controllerId,
        type: type,
      );
      state = AsyncValue.data(appliances);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> createAppliance({
    required String name,
    required String deviceType,
    required String roomId,
    required String controllerId,
    required String brand,
  }) async {
    try {
      final repository = ref.read(appliancesRepositoryProvider);
      await repository.createAppliance(
        name: name,
        deviceType: deviceType,
        roomId: roomId,
        controllerId: controllerId,
        brand: brand,
      );
      await loadAppliances();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAppliance({
    required String id,
    String? name,
    String? deviceType,
    String? roomId,
    String? controllerId,
    String? brand,
  }) async {
    try {
      final repository = ref.read(appliancesRepositoryProvider);
      await repository.updateAppliance(
        id: id,
        name: name,
        deviceType: deviceType,
        roomId: roomId,
        controllerId: controllerId,
        brand: brand,
      );
      await loadAppliances();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAppliance(String id) async {
    try {
      final repository = ref.read(appliancesRepositoryProvider);
      await repository.deleteAppliance(id);
      await loadAppliances();
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/data/models/controller.dart';

final controllersListProvider = StateNotifierProvider<ControllersNotifier, AsyncValue<List<Controller>>>((ref) {
  return ControllersNotifier(ref);
});

class ControllersNotifier extends StateNotifier<AsyncValue<List<Controller>>> {
  final Ref ref;
  
  ControllersNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadControllers();
  }

  Future<void> loadControllers() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(controllersRepositoryProvider);
      final controllers = await repository.getControllers();
      state = AsyncValue.data(controllers);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> createController({
    required String name,
    String? description,
    String? roomId,
  }) async {
    try {
      final repository = ref.read(controllersRepositoryProvider);
      await repository.createController(
        name: name,
        description: description,
        roomId: roomId,
      );
      await loadControllers();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateController({
    required String id,
    String? name,
    String? description,
    String? roomId,
    bool? online,
  }) async {
    try {
      final repository = ref.read(controllersRepositoryProvider);
      await repository.updateController(
        id: id,
        name: name,
        description: description,
        roomId: roomId,
        online: online,
      );
      await loadControllers();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteController(String id) async {
    try {
      final repository = ref.read(controllersRepositoryProvider);
      await repository.deleteController(id);
      await loadControllers();
    } catch (e) {
      rethrow;
    }
  }
}

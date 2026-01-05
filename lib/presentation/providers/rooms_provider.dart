import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/data/models/room.dart';

// final roomsProvider = FutureProvider<List<Room>>((ref) async {
//   final repository = ref.watch(roomsRepositoryProvider);
//   return await repository.getRooms();
// });

final roomsListProvider = StateNotifierProvider<RoomsNotifier, AsyncValue<List<Room>>>((ref) {
  return RoomsNotifier(ref);
});

class RoomsNotifier extends StateNotifier<AsyncValue<List<Room>>> {
  final Ref ref;
  
  RoomsNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadRooms();
  }

  Future<void> loadRooms() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(roomsRepositoryProvider);
      final rooms = await repository.getRooms();
      state = AsyncValue.data(rooms);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> createRoom({required String name, String? description}) async {
    try {
      final repository = ref.read(roomsRepositoryProvider);
      await repository.createRoom(
        name: name,
        description: description,
      );
      await loadRooms();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateRoom({
    required String id,
    String? name,
    String? description,
  }) async {
    try {
      final repository = ref.read(roomsRepositoryProvider);
      await repository.updateRoom(id: id, name: name, description: description);
      await loadRooms();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteRoom(String id) async {
    try {
      final repository = ref.read(roomsRepositoryProvider);
      await repository.deleteRoom(id);
      await loadRooms();
    } catch (e) {
      rethrow;
    }
  }
}

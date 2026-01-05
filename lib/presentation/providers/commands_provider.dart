import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/data/models/command.dart';

final commandsListProvider = StateNotifierProvider<CommandsNotifier, AsyncValue<List<Command>>>((ref) {
  return CommandsNotifier(ref);
});

class CommandsNotifier extends StateNotifier<AsyncValue<List<Command>>> {
  final Ref ref;
  
  CommandsNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadCommands();
  }

  Future<void> loadCommands() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(commandsRepositoryProvider);
      final commands = await repository.getCommands();
      state = AsyncValue.data(commands);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<Command> sendCommand({
    required String roomId,
    required String controllerId,
    required String applianceId,
    required String action,
    Map<String, dynamic>? payload,
    String? irCodeId,
  }) async {
    try {
      final repository = ref.read(commandsRepositoryProvider);
      final command = await repository.sendCommand(
        roomId: roomId,
        controllerId: controllerId,
        applianceId: applianceId,
        action: action,
        payload: payload,
        irCodeId: irCodeId,
      );
      await loadCommands();
      return command;
    } catch (e) {
      rethrow;
    }
  }
}

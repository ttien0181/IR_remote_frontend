import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import '../../core/services/dio_client.dart';
import '../../core/services/storage_service.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/rooms_repository.dart';
import '../../data/repositories/controllers_repository.dart';
import '../../data/repositories/appliances_repository.dart';
import '../../data/repositories/commands_repository.dart';
import '../../data/repositories/telemetry_repository.dart';
import '../../data/repositories/ir_codes_repository.dart';
import '../../data/repositories/room_controllers_repository.dart';
import '../../data/repositories/room_appliances_repository.dart';
import '../../data/repositories/controller_appliances_repository.dart';
import '../../data/repositories/users_repository.dart';

// Storage provider
final storageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(storage: ref.watch(storageProvider));
});

// Dio client provider with logout callback
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(
    storage: ref.watch(storageProvider),
    onUnauthorized: () {
      // Trigger auth state refresh when 401 occurs
      ref.invalidate(authStateProvider);
    },
  );
});

final dioProvider = Provider<Dio>((ref) {
  return ref.watch(dioClientProvider).dio;
});

// Repository providers
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(dio: ref.watch(dioProvider));
});

final roomsRepositoryProvider = Provider<RoomsRepository>((ref) {
  return RoomsRepository(dio: ref.watch(dioProvider));
});

final controllersRepositoryProvider = Provider<ControllersRepository>((ref) {
  return ControllersRepository(dio: ref.watch(dioProvider));
});

final appliancesRepositoryProvider = Provider<AppliancesRepository>((ref) {
  return AppliancesRepository(dio: ref.watch(dioProvider));
});

final commandsRepositoryProvider = Provider<CommandsRepository>((ref) {
  return CommandsRepository(dio: ref.watch(dioProvider));
});

final telemetryRepositoryProvider = Provider<TelemetryRepository>((ref) {
  return TelemetryRepository(dio: ref.watch(dioProvider));
});

final irCodesRepositoryProvider = Provider<IrCodesRepository>((ref) {
  return IrCodesRepository(dio: ref.watch(dioProvider));
});

// New repository providers for filtered data
final roomControllersRepositoryProvider = Provider<RoomControllersRepository>((ref) {
  return RoomControllersRepository(dio: ref.watch(dioProvider));
});

final roomAppliancesRepositoryProvider = Provider<RoomAppliancesRepository>((ref) {
  return RoomAppliancesRepository(dio: ref.watch(dioProvider));
});

final controllerAppliancesRepositoryProvider = Provider<ControllerAppliancesRepository>((ref) {
  return ControllerAppliancesRepository(dio: ref.watch(dioProvider));
});

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  return UsersRepository(dio: ref.watch(dioProvider));
});

// Auth state provider
final authStateProvider = FutureProvider<String?>((ref) async {
  final storage = ref.watch(storageServiceProvider);
  return await storage.getToken();
});

// Current user ID provider
final currentUserIdProvider = FutureProvider<String?>((ref) async {
  final storage = ref.watch(storageServiceProvider);
  return await storage.getUserId();
});

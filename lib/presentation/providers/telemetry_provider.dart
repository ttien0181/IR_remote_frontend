import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter_application_1/core/config/app_config.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/data/models/telemetry.dart';

final socketProvider = Provider<SocketService>((ref) {
  return SocketService(ref);
});

final telemetryDataProvider = StateNotifierProvider<TelemetryNotifier, Map<String, List<RealtimeTelemetryData>>>((ref) {
  return TelemetryNotifier(ref);
});

class SocketService {
  late io.Socket _socket;
  final Ref ref;
  bool _isConnected = false;

  SocketService(this.ref);

  bool get isConnected => _isConnected;

  Future<void> connect() async {
    if (_isConnected) return;

    try {
      // Get JWT token
      final storage = ref.read(storageServiceProvider);
      final token = await storage.getToken();

      if (token == null) {
        throw Exception('No JWT token found');
      }

      _socket = io.io(
        'http://localhost:5000',
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setAuth({'token': token})
            .build(),
      );

      _socket.onConnect((_) {
        print('Socket connected');
        _isConnected = true;
      });

      _socket.onDisconnect((_) {
        print('Socket disconnected');
        _isConnected = false;
      });

      _socket.onError((error) {
        print('Socket error: $error');
        _isConnected = false;
      });

      _socket.connect();
    } catch (e) {
      print('Error connecting to socket: $e');
      _isConnected = false;
      rethrow;
    }
  }

  void disconnect() {
    if (_socket.connected) {
      _socket.disconnect();
      _isConnected = false;
    }
  }

  void onTelemetry(Function(RealtimeTelemetryData) callback) {
    _socket.on('telemetry:new', (data) {
      try {
        final telemetryData = RealtimeTelemetryData.fromJson(data);
        callback(telemetryData);
      } catch (e) {
        print('Error parsing telemetry data: $e');
      }
    });
  }
}

class TelemetryNotifier extends StateNotifier<Map<String, List<RealtimeTelemetryData>>> {
  final Ref ref;

  TelemetryNotifier(this.ref) : super({}) {
    _initializeSocket();
  }

  void _initializeSocket() async {
    try {
      final socketService = ref.read(socketProvider);
      await socketService.connect();
      
      socketService.onTelemetry((data) {
        _addTelemetryData(data);
      });
    } catch (e) {
      print('Error initializing socket: $e');
    }
  }

  void _addTelemetryData(RealtimeTelemetryData data) {
    state = {
      ...state,
      data.controllerId: [
        ...(state[data.controllerId] ?? []),
        data,
      ]
    };
  }

  void clear() {
    state = {};
  }

  void clearControllerData(String controllerId) {
    state = {
      ...state,
      controllerId: [],
    };
  }

  @override
  void dispose() {
    ref.read(socketProvider).disconnect();
    super.dispose();
  }
}

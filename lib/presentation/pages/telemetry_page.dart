import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/presentation/providers/telemetry_provider.dart';
import 'package:flutter_application_1/presentation/providers/controllers_provider.dart';
import 'package:flutter_application_1/presentation/providers/rooms_provider.dart';

class TelemetryPage extends ConsumerStatefulWidget {
  const TelemetryPage({super.key});

  @override
  ConsumerState<TelemetryPage> createState() => _TelemetryPageState();
}

class _TelemetryPageState extends ConsumerState<TelemetryPage> {
  @override
  void dispose() {
    ref.read(socketProvider).disconnect();
    super.dispose();
  }

  String _getRoomName(dynamic roomId, List rooms) {
    try {
      final match = rooms.firstWhere((r) =>
          r.id == roomId ||
          (roomId is Map && (roomId['_id'] == r.id || roomId['id'] == r.id)));
      return match.name;
    } catch (_) {
      return 'Unknown Room';
    }
  }

  Map<String, dynamic> _getLatestMetrics(
    String controllerId,
    Map telemetryState,
  ) {
    final list = telemetryState[controllerId] ?? [];
    if (list.isEmpty) {
      return {
        'temp': null,
        'humid': null,
      };
    }

    // pick newest per metric
    double? temp;
    double? humid;

    for (final t in list) {
      final metric = t.metric.toLowerCase();
      if ((metric == 'temp' || metric == 'temperature') && temp == null) {
        temp = t.value;
      } else if ((metric == 'humid' || metric == 'humidity') && humid == null) {
        humid = t.value;
      }

      if (temp != null && humid != null) break;
    }

    return {
      'temp': temp,
      'humid': humid,
    };
  }

  @override
  Widget build(BuildContext context) {
    final telemetryState = ref.watch(telemetryDataProvider);
    final controllersState = ref.watch(controllersListProvider);
    final roomsState = ref.watch(roomsListProvider);
    final socketService = ref.watch(socketProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Telemetry'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color:
                        socketService.isConnected ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  socketService.isConnected
                      ? 'Connected'
                      : 'Disconnected',
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        socketService.isConnected ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: controllersState.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (controllers) {
          return roomsState.when(
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text(error.toString())),
            data: (rooms) {
              if (controllers.isEmpty) {
                return const Center(child: Text('No controllers found'));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  final controller = controllers[index];
                  final controllerId = controller.id!;
                  final roomName = _getRoomName(controller.roomId, rooms);

                  // extract latest temp+humid from telemetry
                  final latest = _getLatestMetrics(controllerId, telemetryState);

                  final temp = latest['temp'];
                  final humid = latest['humid'];

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(
                        controller.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        roomName,
                        style: const TextStyle(fontSize: 13),
                      ),
                      trailing: Wrap(
                        direction: Axis.horizontal,
                        spacing: 4,
                        children: [
                          _buildMetricChip(
                            label: 'Temp',
                            value: temp == null ? '-- °C' : '${temp.toStringAsFixed(1)} °C',
                            color: Colors.red,
                          ),
                          _buildMetricChip(
                            label: 'Humid',
                            value: humid == null ? '-- %' : '${humid.toStringAsFixed(1)}%',
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMetricChip({
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$label: $value',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

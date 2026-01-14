import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      title: Text(
                        controller.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      subtitle: Text(
                        roomName,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Wrap(
                        spacing: 6,
                        children: [
                          _buildMetricChip(
                            label: 'Temp',
                            value: temp == null
                                ? '-- °C'
                                : '${temp.toStringAsFixed(1)} °C',
                            color: Colors.red,
                          ),
                          _buildMetricChip(
                            label: 'Humid',
                            value: humid == null
                                ? '-- %'
                                : '${humid.toStringAsFixed(1)}%',
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      children: [
                        _buildTelemetryChart(
                          controllerId: controllerId,
                          telemetryState: telemetryState,
                        ),
                      ],
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
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}


Widget _buildTelemetryChart({
  required String controllerId,
  required Map telemetryState,
}) {
  final allData = telemetryState[controllerId] ?? [];

  if (allData.isEmpty) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'No telemetry data',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  final int count = 20;
  final data = allData.length > count ? allData.sublist(allData.length - count) : allData;

  final tempSpots = <FlSpot>[];
  final humidSpots = <FlSpot>[];

  int index = 0;
  for (final t in data) {
    if (t.metric == 'temp' || t.metric == 'temperature') {
      tempSpots.add(FlSpot(index.toDouble(), t.value));
    } else if (t.metric == 'humid' || t.metric == 'humidity') {
      humidSpots.add(FlSpot(index.toDouble(), t.value));
    }
    index++;
  }

  double tempMin = tempSpots.isEmpty ? 0 : tempSpots.map((s) => s.y).reduce((a, b) => a < b ? a : b) - 2;
  double tempMax = tempSpots.isEmpty ? 50 : tempSpots.map((s) => s.y).reduce((a, b) => a > b ? a : b) + 2;

  double humidMin = humidSpots.isEmpty ? 0 : humidSpots.map((s) => s.y).reduce((a, b) => a < b ? a : b) - 2;
  double humidMax = humidSpots.isEmpty ? 100 : humidSpots.map((s) => s.y).reduce((a, b) => a > b ? a : b) + 2;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      const Text('Temperature', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            minY: tempMin,
            maxY: tempMax,
            lineBarsData: [
              LineChartBarData(
                spots: tempSpots,
                isCurved: true,
                color: Colors.red,
                barWidth: 2,
                dotData: FlDotData(show: true),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false, interval: 5),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(show: true, horizontalInterval: 5),
            borderData: FlBorderData(show: true),
          ),
        ),
      ),
      const SizedBox(height: 16),
      const Text('Humidity', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            minY: humidMin,
            maxY: humidMax,
            lineBarsData: [
              LineChartBarData(
                spots: humidSpots,
                isCurved: true,
                color: Colors.blue,
                barWidth: 2,
                dotData: FlDotData(show: true),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false, interval: 5),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(show: true, horizontalInterval: 5),
            borderData: FlBorderData(show: true),
          ),
        ),
      ),
    ],
  );
}

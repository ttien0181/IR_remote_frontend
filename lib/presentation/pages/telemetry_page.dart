import 'package:flutter/material.dart';

class TelemetryPage extends StatelessWidget {
  const TelemetryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telemetry'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.dashboard, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Telemetry page coming soon'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement telemetry page
              },
              child: const Text('View Telemetry'),
            ),
          ],
        ),
      ),
    );
  }
}

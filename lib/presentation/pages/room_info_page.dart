import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/room.dart';

class RoomInfoPage extends StatelessWidget {
  final Room room;

  const RoomInfoPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Room Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildInfoCard('Name', room.name),
            const SizedBox(height: 16),
            if (room.description != null && room.description!.isNotEmpty) ...[
              _buildInfoCard('Description', room.description!),
              const SizedBox(height: 16),
            ],
            if (room.createdAt != null)
              _buildInfoCard(
                'Created',
                room.createdAt.toString().split('.')[0],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../pages/appliance_detail_page.dart';

class ApplianceListSection extends StatefulWidget {
  final List appliances;

  /// nếu truyền → hiện nút Add
  final VoidCallback? onAdd;

  /// nếu truyền → hiện nút Edit
  final void Function(dynamic appliance)? onEdit;

  /// nếu truyền → hiện nút Delete
  final void Function(dynamic appliance)? onDelete;

  const ApplianceListSection({
    super.key,
    required this.appliances,
    this.onAdd,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<ApplianceListSection> createState() => _ApplianceListSectionState();
}

class _ApplianceListSectionState extends State<ApplianceListSection> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAppliances = _query.isEmpty
        ? widget.appliances
        : widget.appliances
            .where((a) =>
                a.name.toLowerCase().contains(_query.toLowerCase()))
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 12),
        _buildSearchBar(),
        const SizedBox(height: 16),
        _buildApplianceList(filteredAppliances),
      ],
    );
  }

  // ================= HEADER =================

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Appliances',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton.icon(
          onPressed: widget.onAdd,
          icon: const Icon(Icons.add, size: 16),
          label: const Text('Add'),
        ),

      ],
    );
  }

  // ================= SEARCH =================

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search appliances...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _query.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    _query = '';
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _query = value.toLowerCase();
        });
      },
    );
  }

  // ================= LIST =================

  Widget _buildApplianceList(List appliances) {
    if (appliances.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text('No appliances found'),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getGridColumns(MediaQuery.of(context).size.width),
        childAspectRatio: 1.1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: appliances.length,
      itemBuilder: (context, index) {
        final appliance = appliances[index];
        final colorScheme = Theme.of(context).colorScheme;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ApplianceDetailPage(appliance: appliance),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.tertiaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            _getDeviceIcon(appliance.deviceType),
                            color: colorScheme.onTertiaryContainer,
                            size: 32,
                          ),
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'edit') {
                              if (widget.onEdit != null) {
                                widget.onEdit!(appliance);
                              }
                            } else if (value == 'delete') {
                              if (widget.onDelete != null) {
                                widget.onDelete!(appliance);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      appliance.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appliance.brand ?? appliance.deviceType ?? 'Unknown',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  int _getGridColumns(double width) {
    if (width < 600) {
      return 2; // Phones
    } else if (width < 1200) {
      return 3; // Tablets
    } else {
      return 4; // Desktop
    }
  }
}


IconData _getDeviceIcon(String? type) {
  // Chuyển về chữ thường để so sánh không phân biệt hoa thường
  final String deviceType = (type ?? '').toLowerCase().trim();

  switch (deviceType) {
    case 'tv':
    case 'television':
      return Icons.tv;
    case 'ac':
    case 'air conditioner':
      return Icons.ac_unit;
    case 'fridge':
    case 'refrigerator':
      return Icons.kitchen;
    case 'light':
    case 'lamp':
      return Icons.lightbulb;
    case 'fan':
      return Icons.air;
    case 'camera':
      return Icons.videocam;
    case 'speaker':
    case 'audio':
      return Icons.speaker;
    case 'washing machine':
      return Icons.local_laundry_service;
    case 'oven':
    case 'microwave':
      return Icons.microwave;
    case 'lock':
      return Icons.lock;
    default:
      return Icons.devices; // Icon mặc định nếu không khớp loại nào
  }
}



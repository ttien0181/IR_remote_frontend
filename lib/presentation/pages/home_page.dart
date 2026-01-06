import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/core/providers/providers.dart';
import 'package:flutter_application_1/core/ui/ui_error.dart';
import 'rooms_page.dart';
import 'controllers_page.dart';
import 'history_page.dart';
import 'telemetry_page.dart';
import 'profile_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const RoomsPage(),
    const ControllersPage(),
    const HistoryPage(),
    const TelemetryPage(),
    const ProfilePage(),
  ];

  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home, label: 'Rooms'),
    _NavItem(icon: Icons.router, label: 'Controllers'),
    _NavItem(icon: Icons.history, label: 'History'),
    _NavItem(icon: Icons.dashboard, label: 'Telemetry'),
    _NavItem(icon: Icons.person, label: 'Profile'),
  ];

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      // Clear auth state
      final storage = ref.read(storageServiceProvider);
      await storage.clearAll();
      
      // Invalidate auth provider to trigger logout
      ref.invalidate(authStateProvider);
      
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
    } catch (e) {
      if (mounted) {
        showAppError(context, e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final isMobile = MediaQuery.of(context).size.width < 600;

    // For mobile and portrait: use drawer
    if (isMobile || !isLandscape) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_navItems[_currentIndex].label),
        ),
        drawer: _buildNavigationDrawer(),
        body: _pages[_currentIndex],
      );
    }

    // For landscape/desktop: use sidebar
    return Scaffold(
      body: Row(
        children: [
          _buildNavigationSidebar(),
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.router, size: 24, color: Colors.blue),
                const SizedBox(height: 6),
                const Text(
                  'IoT IR Control',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _navItems.length,
              itemBuilder: (context, index) {
                final item = _navItems[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.label),
                  selected: _currentIndex == index,
                  selectedTileColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  onTap: () {
                    setState(() => _currentIndex = index);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: _logout,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationSidebar() {
    return Container(
      width: 200,
      color: Colors.grey.shade100,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.router, size: 24, color: Colors.blue),
                const SizedBox(height: 6),
                const Text(
                  'IoT IR Control',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Navigation items
          Expanded(
            child: ListView.builder(
              itemCount: _navItems.length,
              itemBuilder: (context, index) {
                final item = _navItems[index];
                return Container(
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                        : Colors.transparent,
                    border: _currentIndex == index
                        ? Border(
                            left: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 4,
                            ),
                          )
                        : null,
                  ),
                  child: ListTile(
                    leading: Icon(
                      item.icon,
                      color: _currentIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade700,
                    ),
                    title: Text(
                      item.label,
                      style: TextStyle(
                        fontWeight: _currentIndex == index ? FontWeight.w600 : FontWeight.normal,
                        color: _currentIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade700,
                      ),
                    ),
                    onTap: () {
                      setState(() => _currentIndex = index);
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(),
          // Logout button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            onTap: _logout,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  _NavItem({required this.icon, required this.label});
}

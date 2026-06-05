import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_constants.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telangana ANPR Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go(AppRoutes.login),
            tooltip: 'Logout',
          ),
        ],
      ),
      drawer: isDesktop ? null : const _PortalDrawer(),
      body: Row(
        children: [
          if (isDesktop) const SizedBox(width: 280, child: _PortalDrawer()),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _PortalDrawer extends StatelessWidget {
  const _PortalDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'ANPR Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _DrawerItem(
              label: 'Dashboard',
              icon: Icons.dashboard,
              route: AppRoutes.dashboard,
            ),
            _DrawerItem(
              label: 'Vehicle Monitoring',
              icon: Icons.camera_alt,
              route: AppRoutes.vehicleMonitoring,
            ),
            _DrawerItem(
              label: 'Vehicle Classification',
              icon: Icons.category,
              route: AppRoutes.vehicleClassification,
            ),
            _DrawerItem(
              label: 'ANPR Records',
              icon: Icons.document_scanner,
              route: AppRoutes.anprRecords,
            ),
            _DrawerItem(
              label: 'Live Feed',
              icon: Icons.stream,
              route: AppRoutes.liveFeed,
            ),
            _DrawerItem(
              label: 'Cameras',
              icon: Icons.videocam,
              route: AppRoutes.cameras,
            ),
            _DrawerItem(
              label: 'Alerts',
              icon: Icons.warning,
              route: AppRoutes.alerts,
            ),
            _DrawerItem(
              label: 'Reports',
              icon: Icons.insert_chart,
              route: AppRoutes.reports,
            ),
            _DrawerItem(
              label: 'Analytics',
              icon: Icons.analytics,
              route: AppRoutes.analytics,
            ),
            _DrawerItem(
              label: 'Users',
              icon: Icons.people,
              route: AppRoutes.users,
            ),
            _DrawerItem(
              label: 'Settings',
              icon: Icons.settings,
              route: AppRoutes.settings,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        if (isMobile) {
          // Only pop if there is something to pop (prevents popping the app's
          // last page which causes GoRouter to assert when the stack is empty).
          final navigator = Navigator.of(context);
          if (navigator.canPop()) {
            navigator.pop();
          }
        }
        context.go(route);
      },
    );
  }
}

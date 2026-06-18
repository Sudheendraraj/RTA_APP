import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_constants.dart';
import '../../features/auth/auth_notifier.dart';

final sidebarCollapsedProvider = StateProvider<bool>((ref) => false);

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;
    final isCollapsed = ref.watch(sidebarCollapsedProvider);

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isCollapsed ? 70.0 : 280.0,
              child: _PortalDrawer(
                isDrawer: false,
                isCollapsed: isCollapsed,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const _DesktopHeader(),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F5D55),
        title: const Text('Telangana ANPR Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      drawer: const _PortalDrawer(isDrawer: true, isCollapsed: false),
      body: child,
    );
  }
}

class _DesktopHeader extends ConsumerWidget {
  const _DesktopHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 56.0,
      color: const Color(0xFF0F5D55),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 48), // Spacer to balance the logout icon
          const Expanded(
            child: Text(
              'Telangana ANPR Portal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => ref.read(authNotifierProvider.notifier).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
    );
  }
}

class _PortalDrawer extends ConsumerWidget {
  const _PortalDrawer({
    required this.isDrawer,
    required this.isCollapsed,
  });

  final bool isDrawer;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activePath = GoRouterState.of(context).uri.path;
    const sidebarColor = Color(0xFF0A5C53); // Dark teal sidebar background matching Image 2

    final header = isCollapsed
        ? Container(
            height: 56.0,
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                ref.read(sidebarCollapsedProvider.notifier).update((state) => !state);
              },
              tooltip: 'Expand Sidebar',
            ),
          )
        : Container(
            height: 56.0,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    ref.read(sidebarCollapsedProvider.notifier).update((state) => !state);
                  },
                  tooltip: 'Collapse Sidebar',
                ),
                const SizedBox(width: 8),
                const Text(
                  'ANPR Portal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );

    final items = [
      _DrawerItem(
        label: 'Dashboard',
        icon: Icons.dashboard,
        route: AppRoutes.dashboard,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.dashboard,
      ),
      _DrawerItem(
        label: 'Live Feed',
        icon: Icons.stream,
        route: AppRoutes.liveFeed,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.liveFeed,
      ),
      _DrawerItem(
        label: 'Vehicle Monitoring',
        icon: Icons.camera_alt,
        route: AppRoutes.vehicleMonitoring,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.vehicleMonitoring,
      ),
      _DrawerItem(
        label: 'Vehicle Classification',
        icon: Icons.category,
        route: AppRoutes.vehicleClassification,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.vehicleClassification,
      ),
      _DrawerItem(
        label: 'ANPR Records',
        icon: Icons.document_scanner,
        route: AppRoutes.anprRecords,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.anprRecords,
      ),
      _DrawerItem(
        label: 'Cameras',
        icon: Icons.videocam,
        route: AppRoutes.cameras,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.cameras,
      ),
      _DrawerItem(
        label: 'Alerts',
        icon: Icons.warning,
        route: AppRoutes.alerts,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.alerts,
      ),
      _DrawerItem(
        label: 'Reports',
        icon: Icons.insert_chart,
        route: AppRoutes.reports,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.reports,
      ),
      _DrawerItem(
        label: 'Analytics',
        icon: Icons.analytics,
        route: AppRoutes.analytics,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.analytics,
      ),
      _DrawerItem(
        label: 'Users',
        icon: Icons.people,
        route: AppRoutes.users,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.users,
      ),
      _DrawerItem(
        label: 'Settings',
        icon: Icons.settings,
        route: AppRoutes.settings,
        isCollapsed: isCollapsed,
        isActive: activePath == AppRoutes.settings,
      ),
    ];

    final content = Material(
      color: sidebarColor,
      child: Column(
        children: [
          header,
          const Divider(color: Colors.white24, height: 1),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: items,
            ),
          ),
        ],
      ),
    );

    if (isDrawer) {
      return Drawer(
        child: content,
      );
    } else {
      return content;
    }
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.label,
    required this.icon,
    required this.route,
    required this.isCollapsed,
    required this.isActive,
  });

  final String label;
  final IconData icon;
  final String route;
  final bool isCollapsed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final activeBgColor = Colors.white.withValues(alpha: 0.15);
    final hoverColor = Colors.white.withValues(alpha: 0.05);

    if (isCollapsed) {
      return Tooltip(
        message: label,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: InkWell(
            onTap: () {
              if (isMobile) {
                Navigator.of(context).pop();
              }
              context.go(route);
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: isActive ? activeBgColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: isActive ? activeBgColor : Colors.transparent,
        hoverColor: hoverColor,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          if (isMobile) {
            Navigator.of(context).pop();
          }
          context.go(route);
        },
      ),
    );
  }
}

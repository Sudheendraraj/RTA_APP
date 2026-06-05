import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_constants.dart';
import '../core/widgets/responsive_scaffold.dart';
import '../features/alerts/alerts_screen.dart';
import '../features/anpr/anpr_records_screen.dart';
import '../features/auth/auth_notifier.dart';
import '../features/auth/login_screen.dart';
import '../features/analytics/analytics_screen.dart';
import '../features/cameras/cameras_screen.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/reports/reports_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/vehicle_classification/vehicle_classification_screen.dart';
import '../features/vehicle_monitoring/vehicle_monitoring_screen.dart';
import '../features/users/users_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: false,
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authNotifierProvider.notifier).authChangeStream,
    ),
    redirect: (context, state) {
      final loggedIn = authState.isAuthenticated;
      final loggingIn = state.uri.toString() == AppRoutes.login;

      if (!loggedIn && !loggingIn) {
        return AppRoutes.login;
      }
      if (loggedIn && loggingIn) {
        return AppRoutes.dashboard;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: AppRoutes.vehicleMonitoring,
            builder: (context, state) => const VehicleMonitoringScreen(),
          ),
          GoRoute(
            path: AppRoutes.vehicleClassification,
            builder: (context, state) => const VehicleClassificationScreen(),
          ),
          GoRoute(
            path: AppRoutes.anprRecords,
            builder: (context, state) => const AnprRecordsScreen(),
          ),
          GoRoute(
            path: AppRoutes.liveFeed,
            builder: (context, state) =>
                const VehicleMonitoringScreen(isLiveFeed: true),
          ),
          GoRoute(
            path: AppRoutes.cameras,
            builder: (context, state) => const CamerasScreen(),
          ),
          GoRoute(
            path: AppRoutes.alerts,
            builder: (context, state) => const AlertsScreen(),
          ),
          GoRoute(
            path: AppRoutes.reports,
            builder: (context, state) => const ReportsScreen(),
          ),
          GoRoute(
            path: AppRoutes.analytics,
            builder: (context, state) => const AnalyticsScreen(),
          ),
          GoRoute(
            path: AppRoutes.users,
            builder: (context, state) => const UsersScreen(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
});

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<void> stream) {
    notifyListeners();
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<void> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

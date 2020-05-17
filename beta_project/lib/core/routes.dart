import 'package:auto_route/auto_route_annotations.dart';
import 'package:beta_project/presentation/ui/dashboard.dart';
import 'package:beta_project/presentation/ui/login.dart';
import 'package:beta_project/presentation/ui/welcome.dart';

import 'guards.dart';

/// Route manager
/// Registers all routes in the application 
/// https://pub.dev/packages/auto_route
@MaterialAutoRouter()
class $Router {
  @initial
  WelcomeScreen welcomeScreenRoute;
  LoginScreen loginScreenRoute;

  @GuardedBy([AuthGuard])
  DashboardScreen dashboardScreenRoute;
}

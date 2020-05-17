// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:beta_project/presentation/ui/welcome.dart';
import 'package:beta_project/presentation/ui/login.dart';
import 'package:beta_project/presentation/ui/dashboard.dart';
import 'package:beta_project/core/guards.dart';

abstract class Routes {
  static const welcomeScreenRoute = '/';
  static const loginScreenRoute = '/login-screen-route';
  static const dashboardScreenRoute = '/dashboard-screen-route';
  static const all = {
    welcomeScreenRoute,
    loginScreenRoute,
    dashboardScreenRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.dashboardScreenRoute: [AuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WelcomeScreen(),
          settings: settings,
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case Routes.dashboardScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => DashboardScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

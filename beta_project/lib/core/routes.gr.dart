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
import 'package:beta_project/presentation/ui/notifications.dart';

abstract class Routes {
  static const welcomeScreenRoute = '/';
  static const loginScreenRoute = '/login-screen-route';
  static const dashboardScreenRoute = '/dashboard-screen-route';
  static const notificationsScreenRoute = '/notifications-screen-route';
  static const all = {
    welcomeScreenRoute,
    loginScreenRoute,
    dashboardScreenRoute,
    notificationsScreenRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.dashboardScreenRoute: [AuthGuard],
        Routes.notificationsScreenRoute: [AuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreenRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              WelcomeScreen(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.loginScreenRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.dashboardScreenRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DashboardScreen(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          transitionDuration: const Duration(milliseconds: 400),
        );
      case Routes.notificationsScreenRoute:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              NotificationsScreen(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          transitionDuration: const Duration(milliseconds: 400),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

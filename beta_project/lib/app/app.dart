import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/guards.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Entry point of the application
class HomeSysApp extends StatefulWidget {
  @override
  _HomeSysAppState createState() => _HomeSysAppState();
}

class _HomeSysAppState extends State<HomeSysApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home System',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      builder: ExtendedNavigator<Router>(
        router: Router(),
        guards: [AuthGuard()],
      ),
    );
  }
}

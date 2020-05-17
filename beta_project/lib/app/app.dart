import 'package:beta_project/presentation/ui/welcome.dart';
import 'package:flutter/material.dart';

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
      ),
      home: WelcomeScreen(),
    );
  }
}

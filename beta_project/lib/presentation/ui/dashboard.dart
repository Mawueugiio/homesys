import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:beta_project/presentation/bloc/global_state.dart';
import 'package:beta_project/presentation/bloc/prefs/prefs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData _themeData;
  double _kHeight, _kWidth;
  bool _isLoading = false;
  PrefsBloc _prefsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _themeData = Theme.of(context);

    var size = MediaQuery.of(context).size;
    _kWidth = size.width;
    _kHeight = size.height;

    _prefsBloc = BlocProvider.of<PrefsBloc>(context);
    _prefsBloc.add(GetPinEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(kAppName),
        leading: IconButton(
            icon: Icon(Feather.user),
            onPressed: () {
              _scaffoldKey.currentState
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Not available"),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
            }),
        actions: [
          IconButton(
              icon: Icon(Feather.search),
              onPressed: () {
                _scaffoldKey.currentState
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("Not available"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
              }),
          IconButton(
            icon: Icon(Feather.bell),
            onPressed: () => ExtendedNavigator.of(context)
                .pushNamed(Routes.notificationsScreenRoute),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: _prefsBloc,
        builder: (_, GlobalState state) {
          return AnimatedContainer(
            duration: kAnimationDuration,
            child: Container(),
          );
        },
      ),
    );
  }
}

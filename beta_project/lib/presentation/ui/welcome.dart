import 'package:auto_route/auto_route.dart';
import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/routes.gr.dart';
import 'package:beta_project/presentation/bloc/global_state.dart';
import 'package:beta_project/presentation/bloc/prefs/prefs_bloc.dart';
import 'package:beta_project/presentation/widget/buttons.dart';
import 'package:beta_project/presentation/widget/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Welcome screen for first time user
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData _themeData;
  double _kHeight, _kWidth;
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
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocBuilder(
          bloc: _prefsBloc,
          builder: (_, GlobalState state) {
            return AnimatedContainer(
              duration: kAnimationDuration,
              height: _kHeight,
              width: _kWidth,
              padding: EdgeInsets.symmetric(horizontal: kSpacingLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(kAppName, style: _themeData.textTheme.headline4),
                  SizedBox(height: kSpacingXXLarge),
                  SvgPicture.asset(
                    "assets/welcome.svg",
                    semanticsLabel: kAppName,
                    height: _kHeight * 0.3,
                    width: _kWidth * 0.6,
                  ),
                  SizedBox(height: kSpacingXXLarge),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kSpacingLarge),
                    child: Text(
                      kAppDescShort,
                      style: _themeData.textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: kSpacingXXXLarge),
                  state is LoadingState && state.isLoading
                      ? Loading()
                      : state is SuccessState<String> && state.data != null
                          ? ButtonPrimary(
                              text: "Continue",
                              onPressed: () => ExtendedNavigator.of(context)
                                  .pushReplacementNamed(
                                      Routes.dashboardScreenRoute),
                              themeData: _themeData,
                            )
                          : ButtonOutlined(
                              text: "Login",
                              onPressed: () => ExtendedNavigator.of(context)
                                  .pushReplacementNamed(
                                      Routes.loginScreenRoute),
                              themeData: _themeData,
                            ),
                ],
              ),
            );
          }),
    );
  }
}

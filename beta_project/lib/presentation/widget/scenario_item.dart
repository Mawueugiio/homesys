import 'package:beta_project/core/globals.dart';
import 'package:flutter/material.dart';

class ScenarioItem extends StatefulWidget {
  final bool isEnabled;
  final IconData icon;
  final String title;
  final Function onPress;

  const ScenarioItem(
      {Key key, this.isEnabled, this.icon, this.title, this.onPress})
      : super(key: key);

  @override
  _ScenarioItemState createState() => _ScenarioItemState();
}

class _ScenarioItemState extends State<ScenarioItem> {
  ThemeData themeData;
  double kWidth, kHeight;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    final size = MediaQuery.of(context).size;
    kHeight = size.height;
    kWidth = size.width;

    return Container(
      height: kWidth * 0.25,
      width: kWidth * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingXLarge),
        color: widget.isEnabled
            ? themeData.primaryColor
            : themeData.scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(widget.icon),
          SizedBox(height: kSpacingLarge),
          Text(widget.title),
        ],
      ),
    );
  }
}

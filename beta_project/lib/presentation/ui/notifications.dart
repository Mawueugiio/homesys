import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:beta_project/core/mock.dart';
import 'package:beta_project/core/services/notification_service.dart';
import 'package:beta_project/data/models/member.dart';
import 'package:beta_project/presentation/widget/recents.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  ThemeData _themeData;
  double _kHeight, _kWidth;
  List<Visitor> _visitors = kVisitors;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _themeData = Theme.of(context);

    var size = MediaQuery.of(context).size;
    _kWidth = size.width;
    _kHeight = size.height;

    if (mounted) _refreshKey?.currentState?.show();
  }

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    if (mounted) {
      setState(() {
        _visitors = kVisitors..where((element) => element.isWaiting);
      });
      sl.get<NotificationService>().clearAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(EvaIcons.arrowLeftOutline, color: kWhite),
            onPressed: () => Navigator.pop(context)),
      ),
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: RefreshIndicator(
        key: _refreshKey,
        onRefresh: _loadNotifications,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: _kHeight,
              width: _kWidth,
              child: Stack(
                children: [
                  Container(
                    height: _kHeight * 0.35,
                    color: _themeData.accentColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Notifications",
                          style: _themeData.textTheme.headline4
                              .copyWith(color: kWhite),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: kSpacingSmall),
                        Text(
                          "Shows alerts on who is entering your premises",
                          style: _themeData.textTheme.subtitle2
                              .copyWith(color: kWhite),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: _kHeight * 0.3,
                    bottom: 0,
                    width: _kWidth,
                    child: Container(
                      width: _kWidth,
                      decoration: kCurvedBackground.copyWith(
                          color: _themeData.scaffoldBackgroundColor),
                      padding: EdgeInsets.all(kSpacingXLarge),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recents",
                                style: _themeData.textTheme.caption.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox.shrink()
                            ],
                          ),
                          SizedBox(height: kSpacingXLarge),
                          Flexible(
                            child: AnimationLimiter(
                              child: ListView.separated(
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: kSpacingNormal),
                                  padding: const EdgeInsets.all(kSpacingNone),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: _visitors.length,
                                  // reverse: true,
                                  itemBuilder: (_, int index) {
                                    return _visitors.isEmpty
                                        ? Center(
                                            child: Text(
                                              'No new notifications',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          )
                                        : AnimationConfiguration.staggeredList(
                                            position: index,
                                            duration: kAnimationDuration,
                                            child: ScaleAnimation(
                                              child: FadeInAnimation(
                                                child: RecentVisitor(
                                                    person: _visitors[index]),
                                              ),
                                            ),
                                          );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

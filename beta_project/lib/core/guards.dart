import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This restricts unauthenticated users from accessing the guarded routes
/// https://pub.dev/packages/auto_route#route-guards
class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token_key') != null;
  }
}

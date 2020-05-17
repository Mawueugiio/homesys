import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service locator
GetIt sl = GetIt.instance;

Future<void> registerServices() async {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());
}

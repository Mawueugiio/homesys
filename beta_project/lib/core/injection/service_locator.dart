import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service locator
GetIt sl = GetIt.instance;

Future<void> registerServices() async {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());

  // Firebase APIs
  sl.registerSingleton<Firestore>(Firestore.instance);
  sl.registerSingleton<FirebaseMessaging>(FirebaseMessaging());
  sl.registerSingleton<StorageReference>(
      FirebaseStorage.instance.ref().child(kAppNameShort));

  // Services
  sl.registerSingleton<DatabaseService>(DatabaseService.instance);
}

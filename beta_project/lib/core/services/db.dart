import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:beta_project/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Service for Cloud Firestore
class DatabaseService {
  final Firestore _db;

  DatabaseService._(this._db);

  static final DatabaseService instance =
      DatabaseService._(sl.get<Firestore>());

  /// Returns all users in the database
  Stream<List<User>> getUsers() => _db.collection(kUsersRef).snapshots().map(
      (event) => event.documents.map((e) => User.fromJson(e.data)).toList());

  /// Returns all members for a particular user with [pin] in the database
  Stream<List<User>> getMembers(String pin) => _db
      .collection(kUsersRef)
      .document(pin)
      .collection(kMembersRef)
      .snapshots()
      .map((event) =>
          event.documents.map((e) => User.fromJson(e.data)).toList());

  /// Returns the current user with [pin]
  Stream<User> getMemberById(String pin) => _db
      .collection(kUsersRef)
      .document(pin)
      .snapshots()
      .map((event) => User.fromJson(event.data));

  Future<void> getOrCreateUser(String pin) async {
    final token = await sl.get<FirebaseMessaging>().getToken();
    print("User's token -> $token");
    final docRef = _db.collection(kUsersRef).document(pin);
    var snapshot = await docRef.get();
    if (snapshot.exists && snapshot.documentID == pin) {
      print("User exists already");
      return docRef.setData({
        "token": token,
      }, merge: true);
    }
    return docRef.setData(
        User(
          kDefaultUserName,
          token,
          pin,
          kDefaultAvatar,
          <String>[
            "Light",
            "AC",
            "Door",
            "WiFi",
            "Smart TV",
          ],
          <String>[
            "Home",
            "Away",
            "Sleep",
            "Get up",
          ],
          DateTime.now().millisecondsSinceEpoch,
        ).toJson(),
        merge: true);
  }
}

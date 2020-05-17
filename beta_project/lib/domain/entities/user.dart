/// Base class for all users
abstract class UserEntity {
  final String name;
  final String token;
  final String pin;
  final String avatar;
  final List<String> devices;
  final int lastSeen;
  final List<dynamic> scenes;

  UserEntity(this.name, this.token, this.pin, this.avatar, this.devices,
      this.lastSeen, this.scenes);
}

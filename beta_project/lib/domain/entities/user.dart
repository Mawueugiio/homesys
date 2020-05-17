/// Base class for all users
abstract class UserEntity {
  final String name;
  final String token;
  final String pin;
  final String avatar;
  final int lastSeen;

  UserEntity(this.name, this.token, this.pin, this.avatar, this.lastSeen);
}

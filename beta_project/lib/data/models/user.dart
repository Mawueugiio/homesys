import 'package:beta_project/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends UserEntity {
  User(String name, String token, String pin, String avatar,
      List<String> devices, List<String> scenes, int lastSeen)
      : super(name, token, pin, avatar, devices, scenes, lastSeen);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

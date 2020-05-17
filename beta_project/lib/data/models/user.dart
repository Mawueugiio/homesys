import 'package:beta_project/data/models/scene.dart';
import 'package:beta_project/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends UserEntity {
  User(String name, String token, String pin, String avatar,
      List<String> devices, int lastSeen, List<Scene> scenes)
      : super(name, token, pin, avatar, devices, lastSeen, scenes);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

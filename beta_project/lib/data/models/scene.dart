import 'package:beta_project/domain/entities/scene.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scene.g.dart';

@JsonSerializable()
class Scene extends SceneEntity {
  Scene(String title, String iconName) : super(title, iconName);

  factory Scene.fromJson(Map<String, dynamic> json) => _$SceneFromJson(json);

  Map<String, dynamic> toJson() => _$SceneToJson(this);
}

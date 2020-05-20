import 'package:beta_project/data/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact extends User {
  final String relation;

  const Contact(String name, String token, String pin, String avatar,
      int lastSeen, this.relation)
      : super(name, token, pin, avatar, lastSeen);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

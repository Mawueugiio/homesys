import 'package:beta_project/data/models/contact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

/// Member of house
@JsonSerializable()
class Visitor extends Contact {
  final int entryTime;
  bool isAllowed;
  bool isWaiting;

  Visitor(
    String name,
    String token,
    String pin,
    String avatar,
    int lastSeen,
    String relation,
    this.entryTime, {
    this.isAllowed = false,
    this.isWaiting = true,
  }) : super(name, token, pin, avatar, lastSeen, relation);

  factory Visitor.fromJson(Map<String, dynamic> json) =>
      _$VisitorFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visitor _$VisitorFromJson(Map<String, dynamic> json) {
  return Visitor(
    json['name'] as String,
    json['token'] as String,
    json['pin'] as String,
    json['avatar'] as String,
    json['lastSeen'] as int,
    json['relation'] as String,
    json['entryTime'] as int,
  );
}

Map<String, dynamic> _$VisitorToJson(Visitor instance) => <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'pin': instance.pin,
      'avatar': instance.avatar,
      'lastSeen': instance.lastSeen,
      'relation': instance.relation,
      'entryTime': instance.entryTime,
    };

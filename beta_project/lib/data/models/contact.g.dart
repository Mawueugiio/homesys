// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    json['name'] as String,
    json['token'] as String,
    json['pin'] as String,
    json['avatar'] as String,
    json['lastSeen'] as int,
    json['relation'] as String,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'pin': instance.pin,
      'avatar': instance.avatar,
      'lastSeen': instance.lastSeen,
      'relation': instance.relation,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['token'] as String,
    json['pin'] as String,
    json['avatar'] as String,
    (json['devices'] as List)?.map((e) => e as String)?.toList(),
    json['lastSeen'] as int,
    (json['scenes'] as List)
        ?.map(
            (e) => e == null ? null : Scene.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'pin': instance.pin,
      'avatar': instance.avatar,
      'devices': instance.devices,
      'lastSeen': instance.lastSeen,
      'scenes': instance.scenes,
    };

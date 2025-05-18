// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthVO _$AuthVOFromJson(Map<String, dynamic> json) => AuthVO(
  id: json['id'] as String,
  username: json['username'] as String,
  token: json['token'] as String,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AuthVOToJson(AuthVO instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'token': instance.token,
  'roles': instance.roles,
};

AuthLoginVO _$AuthLoginVOFromJson(Map<String, dynamic> json) => AuthLoginVO(
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$AuthLoginVOToJson(AuthLoginVO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

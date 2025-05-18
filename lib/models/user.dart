import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class AuthVO {
  final String id;
  final String username;
  @JsonKey(includeIfNull: false)
  final String token;
  final List<String> roles;
  AuthVO({required this.id,required this.username, required this.token, required this.roles});


  factory AuthVO.fromJson(Map<String, dynamic> json) => _$AuthVOFromJson(json);
  Map<String, dynamic> toJson() => _$AuthVOToJson(this);

  @override
  String toString() {
    return 'AuthVO{id: $id,username: $username, token: $token, roles: $roles}';
  }
}

@JsonSerializable()
class AuthLoginVO {
  final String username;
  final String password;

  AuthLoginVO({required this.username, required this.password});

  factory AuthLoginVO.fromJson(Map<String, dynamic> json) => _$AuthLoginVOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginVOToJson(this);

  @override
  String toString() {
    return 'AuthLoginVO{username: $username, password: $password}';
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final int code;
  final String message;
  final T data;

  BaseResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  // 需要传入泛型的 fromJson 函数
  factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  // 需要传入泛型的 toJson 函数
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  String toString() {
    return 'BaseResponse{code: $code, message: $message, data: $data}';
  }
}

import 'package:json_annotation/json_annotation.dart';


part 'common.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LabelVO<T> {
  final String label;
  final T value;

  LabelVO({
    required this.label,
    required this.value,
  });

  // 需要传入泛型的 fromJson 函数
  factory LabelVO.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$LabelVOFromJson(json, fromJsonT);

  // 需要传入泛型的 toJson 函数
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$LabelVOToJson(this, toJsonT);

  @override
  String toString() {
    return 'LabelVO{label: $label, value: $value}';
  }


}
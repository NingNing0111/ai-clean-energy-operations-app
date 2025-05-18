// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabelVO<T> _$LabelVOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    LabelVO<T>(label: json['label'] as String, value: fromJsonT(json['value']));

Map<String, dynamic> _$LabelVOToJson<T>(
  LabelVO<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'label': instance.label,
  'value': toJsonT(instance.value),
};

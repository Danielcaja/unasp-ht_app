// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventFromJson(Map<String, dynamic> json) {
  return Events(
    json['id'] as int,
    json['userId'] as int,
    json['description'] as String,
    json['ensinoId'] as int,
    json['courseId'] as int,
    json['semesterId'] as int,
    json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    json['finalDate'] == null
        ? null
        : DateTime.parse(json['finalDate'] as String),
  );
}

Map<String, dynamic> _$EventToJson(Events instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'description': instance.description,
      'ensinoId': instance.ensinoId,
      'courseId': instance.courseId,
      'semesterId': instance.semesterId,
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

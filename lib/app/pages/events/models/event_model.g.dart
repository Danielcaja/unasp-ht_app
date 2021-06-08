// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventFromJson(Map<String, dynamic> json) {
  return Events(
    json['id'] as int,
    json['userId'] as String,
    json['description'] as String,
    json['ensinoId'] as int,
    json['courseId'] as int,
    json['semesterId'] as int,
    json['subjectDescription'] as String,
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
      'subjectDescription': instance.subjectDescription,
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    json['id'] as int,
    json['description'] as String,
    json['ensinoId'] as int,
    json['sigla'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'ensinoId': instance.id,
      'sigla': instance.description,
    };

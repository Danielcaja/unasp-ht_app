import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class Course {
  final int id;
  final String description;
  final int ensinoId;
  final String sigla;

  Course(this.id, this.description, this.ensinoId, this.sigla);

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

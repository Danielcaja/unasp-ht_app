import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class Events {
  int id;
  final int userId;
  final String description;
  final int ensinoId;
  final int courseId;
  final int semesterId;
  final DateTime startDate;
  final DateTime finalDate;

  Events(this.id, this.userId, this.description, this.ensinoId, this.courseId,
      this.semesterId, this.startDate, this.finalDate);

  factory Events.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

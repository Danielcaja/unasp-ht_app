import 'package:json_annotation/json_annotation.dart';

part 'departure_model.g.dart';

@JsonSerializable()
class Departure {
  final DateTime going;
  final DateTime turning;
  final String location;
  final String reason;
  final DepartureStatus status;
  final String userId;

  Departure(this.going, this.turning, this.location, this.reason, this.status,
      this.userId);

  factory Departure.fromJson(Map<String, dynamic> json) =>
      _$DepartureFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureToJson(this);
}

enum DepartureStatus { solicitado, aprovado, rejeitado }

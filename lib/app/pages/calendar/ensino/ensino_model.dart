import 'package:json_annotation/json_annotation.dart';

part 'ensino_model.g.dart';

@JsonSerializable()
class Ensino {
  final Number id;
  final String name;

  Ensino(this.id, this.name);

  factory Ensino.fromJson(Map<Number, String> json) => _$EnsinoFromJson(json);
  Map<Number, String> toJson() => _$EnsinoToJson(this);
}

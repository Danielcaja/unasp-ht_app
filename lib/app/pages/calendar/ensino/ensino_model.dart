import 'package:json_annotation/json_annotation.dart';

part 'ensino_model.g.dart';

@JsonSerializable()
class Ensino {
  final int id;
  final String name;

  Ensino(this.id, this.name);

  factory Ensino.fromJson(Map<String, dynamic> json) => _$EnsinoFromJson(json);
  Map<String, dynamic> toJson() => _$EnsinoToJson(this);
}

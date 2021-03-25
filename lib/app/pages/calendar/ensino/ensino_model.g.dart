// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ensino_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$EnsinoFromJson(Map<Number, String> json) {
  return Ensino(
    json['id'] as Number,
    json['name'] as String,
  );
}

Map<Number, String> _$EnsinoToJson(Ensino instance) => <Number, String>{
      'id': instance.id,
      'name': instance.name,
    };

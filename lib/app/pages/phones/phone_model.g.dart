// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone(
    json['name'] as String,
    json['phone'] as String,
  );
}

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };

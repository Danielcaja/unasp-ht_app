// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
    json['name'] as String,
    json['likes'] as int,
    json['dislikes'] as int,
    json['id'] as String,
  );
}

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'name': instance.name,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
    };

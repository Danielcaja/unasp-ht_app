import 'package:json_annotation/json_annotation.dart';

part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItem {
  final String name;
  final int likes;
  final int dislikes;

  MenuItem(this.name, this.likes, this.dislikes);

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}

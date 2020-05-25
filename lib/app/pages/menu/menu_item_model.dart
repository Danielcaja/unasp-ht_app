import 'package:json_annotation/json_annotation.dart';

part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItem {
  String id;
  String name;
  int likes;
  int dislikes;

  bool wasLiked;
  bool wasDisliked;

  MenuItem(this.name, this.likes, this.dislikes, this.id);

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}

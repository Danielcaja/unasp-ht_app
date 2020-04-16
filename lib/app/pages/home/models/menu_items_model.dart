import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'menu_items_model.g.dart';

@HiveType(typeId: 0)
class MenuItems {
  @HiveField(0)
  String title;
  @HiveField(1)
  IconData icon;
  @HiveField(2)
  bool visible;
}

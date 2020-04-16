// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_items_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemsAdapter extends TypeAdapter<MenuItems> {
  @override
  final typeId = 0;

  @override
  MenuItems read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItems()
      ..title = fields[0] as String
      ..icon = fields[1] as IconData
      ..visible = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, MenuItems obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.visible);
  }
}

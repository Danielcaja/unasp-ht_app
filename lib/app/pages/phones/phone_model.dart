import 'package:json_annotation/json_annotation.dart';

part 'phone_model.g.dart';

@JsonSerializable()
class Phone {
  final String name;
  final String phone;

  Phone(this.name, this.phone);

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}

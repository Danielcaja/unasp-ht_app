import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class UserModel {
  String name;
  String email;
  String password;
  String genre;
  String imagePath;
  CategoryEnum mainCategory;
  CategoryEnum secondaryCategory;
  double ra;
  String uid;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    email = json['email'] as String;
    genre = json['genre'] as String;
    imagePath = json['imagePath'] as String;
    mainCategory = CategoryEnum.values[json['mainCategory'] as int];
    secondaryCategory = CategoryEnum.values[json['secondaryCategory'] as int];
    ra = json['ra'] as double;
    uid = json['uid'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['genre'] = genre;
    data['uid'] = uid;
    data['imagePath'] = imagePath;
    data['mainCategory'] = mainCategory.index;
    data['secondaryCategory'] =
        secondaryCategory != null ? secondaryCategory.index : null;
    data['ra'] = ra;
    return data;
  }
}

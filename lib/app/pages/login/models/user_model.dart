import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class UserModel {
  String name;
  String email;
  String password;
  String genre;
  CategoryEnum mainCategory;
  CategoryEnum secondaryCategory;
  double ra;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    genre = json['genre'];
    mainCategory = json['mainCategory'];
    secondaryCategory = json['secondaryCategory'];
    ra = json['ra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['genre'] = this.genre;
    data['mainCategory'] = this.mainCategory.index;
    data['secondaryCategory'] = this.secondaryCategory.index;
    data['ra'] = this.ra;
    return data;
  }
}

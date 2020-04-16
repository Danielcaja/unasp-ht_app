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
    name = json['name'];
    email = json['email'];
    genre = json['genre'];
    imagePath = json['imagePath'];
    mainCategory = CategoryEnum.values[json['mainCategory']];
    secondaryCategory = CategoryEnum.values[json['secondaryCategory']];
    ra = json['ra'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['genre'] = this.genre;
    data['uid'] = this.uid;
    data['imagePath'] = this.imagePath;
    data['mainCategory'] = this.mainCategory.index;
    data['secondaryCategory'] =
        this.secondaryCategory != null ? this.secondaryCategory.index : null;
    data['ra'] = this.ra;
    return data;
  }
}

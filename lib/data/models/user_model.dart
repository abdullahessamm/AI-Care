import 'package:ai_care/domain/entities/user.dart';

class UserModel {
  late User user;

  UserModel.fromJson(Map<String, dynamic> json) {
    user = User(
        uid: json["uid"],
        name: json["name"],
        birthDate: json["birthDate"],
        email: json["email"]);
  }
}

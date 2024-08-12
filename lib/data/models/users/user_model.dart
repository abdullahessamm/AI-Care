import 'package:ai_care/data/models/model_interface.dart';

abstract class UserModel implements IModel {
  String? uid;
  String? name;
  String? email;
  String? gender;
  String? phoneNumber;
  DateTime? creationDate;
  DateTime? lastSignInDate;

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "gender": gender,
      "phoneNumber": phoneNumber,
      "creationDate": creationDate,
      "lastSignInDate": lastSignInDate,
    };
  }

  void assignUserData(Map<String, dynamic> json) {
    uid = json["uid"];
    name = json["name"];
    email = json["email"];
    gender = json["gender"];
    phoneNumber = json["phoneNumber"];
    creationDate = json["creationDate"];
    lastSignInDate = json["lastSignInDate"];
  }
}

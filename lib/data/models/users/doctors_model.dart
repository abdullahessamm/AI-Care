import 'package:ai_care/data/models/users/user_model.dart';

class DoctorsModel extends UserModel {
  String? specialty;

  DoctorsModel.fromMap(Map<String, dynamic> map) {
    assignUserData(map);
    specialty = map['specialty'];
  }

  @override
  Map<String, dynamic> toMap() {
    final parentMap = super.toMap();
    parentMap["specialty"] = specialty;
    return parentMap;
  }
}

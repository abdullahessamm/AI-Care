import 'package:ai_care/data/models/users/user_model.dart';

class PatientsModel extends UserModel {
  String? diseaseType;
  DateTime? diseaseDate;
  DateTime? birthDate;

  @override
  PatientsModel.fromMap(Map<String, dynamic> map) {
    assignUserData(map);
    diseaseType = map["diseaseType"];
    diseaseDate = map["diseaseDate"];
    birthDate = map["birthDate"];
  }

  @override
  Map<String, dynamic> toMap() {
    final parentMap = super.toMap();
    parentMap["diseaseType"] = diseaseType;
    parentMap["diseaseDate"] = diseaseDate;
    parentMap["birthDate"] = birthDate;

    return parentMap;
  }
}

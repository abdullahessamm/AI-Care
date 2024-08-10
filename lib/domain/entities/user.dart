class User {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? gender;
  final String? photoUri;
  final String? phoneNumber;
  final DateTime? birthDate;
  final DateTime? creationDate;
  final DateTime? lastSignInDate;
  final bool? isEmailVerified;
  final bool? isDoctor;

  User({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.photoUri,
    this.phoneNumber,
    this.birthDate,
    this.creationDate,
    this.lastSignInDate,
    this.gender,
    this.isEmailVerified,
    this.isDoctor,
  });
}

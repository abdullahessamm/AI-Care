class User {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? gender;
  final String? phoneNumber;
  final DateTime? creationDate;
  final DateTime? lastSignInDate;

  User({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.creationDate,
    this.lastSignInDate,
    this.gender,
  });
}

import 'package:ai_care/core/errors/firebase_errors.dart';
import 'package:ai_care/data/datasources/auth/firebase_auth_datasource.dart';
import 'package:ai_care/domain/entities/user.dart';
import 'package:ai_care/domain/repositories/auth_repository_interfaces.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class FirebaseAuthRepository
    implements IAuthRepository, IAuthWithGoogleRepository {
  final FirebaseAuthDatasource _authDatasource =
      FirebaseAuthDatasource.instance;

  static final FirebaseAuthRepository _instance = FirebaseAuthRepository._();

  FirebaseAuthRepository._();

  static FirebaseAuthRepository get instance => _instance;

  @override
  Future<AuthResult> login(
      {required String email, required String password}) async {
    try {
      firebase.UserCredential credential =
          await _authDatasource.login(email: email, password: password);
      return AuthResult.success(_mapAuthUser(credential));
    } on FirebaseErrors catch (e) {
      return AuthResult.failure(e.message);
    }
  }

  @override
  Future<void> logout() {
    return _authDatasource.logout();
  }

  @override
  Future<AuthResult> signUp(
      {required String email, required String password}) async {
    firebase.UserCredential credential =
        await _authDatasource.signUp(email: email, password: password);
    return AuthResult.success(_mapAuthUser(credential));
  }

  @override
  Stream<User?> get userStream => _authDatasource.userStream;

  @override
  Future<AuthResult> loginWithGoogle() async {
    firebase.UserCredential credential =
        await _authDatasource.loginWithGoogle();
    return AuthResult.success(_mapAuthUser(credential));
  }
}

User _mapAuthUser(firebase.UserCredential credential) {
  return User(uid: credential.user?.uid, email: credential.user?.email);
}

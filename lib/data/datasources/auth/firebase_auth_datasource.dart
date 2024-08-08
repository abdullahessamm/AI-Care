import 'dart:async';

import 'package:ai_care/data/datasources/auth/auth_datasource_interface.dart';
import 'package:ai_care/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class FirebaseAuthDatasource implements IAuthDatasource {
  final firebase.FirebaseAuth _auth;

  FirebaseAuthDatasource({firebase.FirebaseAuth? auth})
      : _auth = auth ?? firebase.FirebaseAuth.instance;

  @override
  Future<AuthResult> login(
      {required String email, required String password}) async {
    try {
      firebase.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return AuthResult.success(_mapAuthUser(result));
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(e.code);
    }
  }

  @override
  Future<void> logout() {
    return _auth.signOut();
  }

  @override
  Future<AuthResult> signUp(
      {required String email, required String password}) async {
    try {
      firebase.UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthResult.success(_mapAuthUser(result));
    } on firebase.FirebaseAuthException catch (e) {
      return AuthResult.failure(e.code);
    }
  }

  @override
  Stream<User?> get userStream {
    StreamController<User?> stream = StreamController<User?>();
    _auth
        .authStateChanges()
        .listen((user) => stream.add(User(uid: user?.uid, email: user?.email)));
    return stream.stream;
  }
}

User _mapAuthUser(firebase.UserCredential credential) {
  return User(uid: credential.user?.uid, email: credential.user?.email);
}

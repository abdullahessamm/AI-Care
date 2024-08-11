import 'dart:async';

import 'package:ai_care/core/errors/firebase_errors.dart';
import 'package:ai_care/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDatasource {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// private constructor to prevent instantiation from outside the package.
  FirebaseAuthDatasource._privateConstructor();

  /// returns the singleton instance of FirebaseAuthDatasource.
  static final FirebaseAuthDatasource _instance =
      FirebaseAuthDatasource._privateConstructor();

  /// getter for the singleton instance of FirebaseAuthDatasource.
  static get instance => _instance;

  /// logs in a user using email and password.
  /// throws FirebaseErrors if login fails.
  /// returns the logged in user.
  /// If the user is not authenticated, it throws an error for unknowns errors.
  Future<firebase.UserCredential> login(
      {required String email, required String password}) async {
    _auth.currentUser?.updateProfile();
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on firebase.FirebaseAuthException catch (e) {
      throw FirebaseErrors(code: e.code, message: e.message);
    } catch (e) {
      throw FirebaseErrors(
          code: 'unknown', message: 'An unknown error occurred');
    }
  }

  /// logs in a user using Google.
  /// throws FirebaseErrors if login fails.
  /// returns the logged in user.
  /// If the user is not authenticated, it throws an error for unknowns errors.
  Future<firebase.UserCredential> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw FirebaseErrors(
            code: 'google_sign_in_cancelled',
            message: 'Google sign in cancelled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final firebase.OAuthCredential credential =
          firebase.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return await _auth.signInWithCredential(credential);
    } on firebase.FirebaseAuthException catch (e) {
      throw FirebaseErrors(code: e.code, message: e.message);
    } catch (e) {
      throw FirebaseErrors(
          code: 'unknown', message: 'An unknown error occurred');
    }
  }

  /// logs out the current user.
  Future<void> logout() {
    return _auth.signOut();
  }

  /// signs up a user using email and password.
  /// throws FirebaseErrors if signup fails.
  /// returns the signed up user.
  /// If the user is not authenticated, it throws an error for unknowns errors.
  Future<firebase.UserCredential> signUp(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on firebase.FirebaseAuthException catch (e) {
      throw FirebaseErrors(code: e.code, message: e.message);
    } catch (e) {
      throw FirebaseErrors(
          code: 'unknown', message: 'An unknown error occurred');
    }
  }

  firebase.User? get user => _auth.currentUser;

  /// getter for the current user as synchronously.
  Stream<User?> get userStream {
    return _auth.authStateChanges().map((firebase.User? user) =>
        user != null ? User(uid: user.uid, email: user.email) : null);
  }
}

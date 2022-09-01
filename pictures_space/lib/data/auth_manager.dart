import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pictures_space/domain/auth_manager.dart';

class AuthManagerImpl extends AuthManager {
  AuthManagerImpl(
      super.firebaseAuth, super.googleSignIn, super.googleAuthProvider);

  @override
  Stream<User?> getUserStream() => firebaseAuth.userChanges();

  @override
  Future<UserCredential?> signInGoogle() async {
    if (kIsWeb) {
      return await _signInWeb();
    } else {
      return await _signInNonWeb();
    }
  }

  @override
  Future<UserCredential?> signInEmail(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
    return null;
  }

  @override
  Future<UserCredential?> register(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  @override
  bool get isLoggedIn => firebaseAuth.currentUser != null;

  Future<UserCredential?> _signInWeb() async {
    try {
      return await firebaseAuth.signInWithPopup(googleAuthProvider);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return null;
  }

  Future<UserCredential?> _signInNonWeb() async {
    final account = await googleSignIn.signIn();
    if (account != null) {
      try {
        final googleAuth = await account.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        return await firebaseAuth.signInWithCredential(credential);
      } catch (error) {
        if (kDebugMode) {
          print(error.toString());
        }
      }
    }
    return null;
  }

  @override
  Future<void> signOut() => firebaseAuth.signOut();
}

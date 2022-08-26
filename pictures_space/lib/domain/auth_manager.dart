import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthManager {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final GoogleAuthProvider googleAuthProvider;

  Stream<User?> getUserStream();

  Future<UserCredential?> signInGoogle();

  Future<UserCredential?> signInEmail(String email, String password);

  Future<UserCredential?> register(String email, String password);

  bool get isLoggedIn;

  AuthManager(this.firebaseAuth, this.googleSignIn, this.googleAuthProvider);
}

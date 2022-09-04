import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class LoadingState extends AuthState {}

class LoadedState extends AuthState {}

class SuccessState extends AuthState {
  final UserCredential userCredential;

  SuccessState(this.userCredential);
}

class ErrorState extends AuthState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class RegistrationState extends AuthState {}

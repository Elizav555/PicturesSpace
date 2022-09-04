import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../domain/auth_manager.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthManager _authManager;

  AuthBloc(this._authManager) : super(LoadedState()) {
    on<SignInEvent>(signIn);
    on<GoogleSignInEvent>(googleSignIn);
    on<RegisterEvent>(register);
  }

  Future<void> signIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    final cred = await _authManager.signInEmail(event.email, event.password);
    cred != null ? emit(SuccessState(cred)) : emit(ErrorState(''));
  }

  Future<void> googleSignIn(
      GoogleSignInEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    final cred = await _authManager.signInGoogle();
    cred != null ? emit(SuccessState(cred)) : emit(ErrorState(''));
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(LoadingState());
    emit(RegistrationState());
  }
}

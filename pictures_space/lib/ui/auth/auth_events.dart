abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class GoogleSignInEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

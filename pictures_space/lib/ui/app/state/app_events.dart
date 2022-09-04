import 'package:pictures_space/domain/model/app_user.dart';

abstract class AppEvent {}

class ErrorEvent extends AppEvent {
  final String errorMessage;

  ErrorEvent(this.errorMessage);
}

class AuthorizeEvent extends AppEvent {
  final AppUser user;

  AuthorizeEvent(this.user);
}

class UnauthorizedEvent extends AppEvent {
  UnauthorizedEvent();
}

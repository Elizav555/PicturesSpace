import 'package:fluro/fluro.dart';

import '../../../domain/model/app_user.dart';

abstract class AppState {
  final FluroRouter router;

  AppState(this.router);
}

class ErrorState extends AppState {
  final String errorMessage;

  ErrorState(super.router, this.errorMessage);
}

class AuthorizedState extends AppState {
  final AppUser user;

  AuthorizedState(super.router, this.user);
}

class UnauthorizedState extends AppState {
  UnauthorizedState(super.router);
}

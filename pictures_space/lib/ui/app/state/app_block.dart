import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluro/fluro.dart';

import '../../../domain/auth_manager.dart';
import '../../../domain/pictures_space_repository.dart';
import 'app_events.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final FluroRouter _router;
  final AuthManager _authManager;
  final PicturesSpaceRep _rep;

  AppBloc(this._router, this._authManager, this._rep)
      : super(UnauthorizedState(_router)) {
    _authManager.getUserStream().listen((user) async {
      if (user == null) {
        add(UnauthorizedEvent());
      } else {
        final appUser = await _rep.getUser(user.uid);
        if (appUser == null) {
          add(UnauthorizedEvent());
        } else {
          add(AuthorizeEvent(appUser));
        }
      }
    });
    on<UnauthorizedEvent>(handleUnauthorized);
    on<AuthorizeEvent>(handleAuthorized);
    on<ErrorEvent>(handleError);
  }

  FutureOr<void> handleUnauthorized(
      UnauthorizedEvent event, Emitter<AppState> emit) {
    emit(UnauthorizedState(_router));
  }

  FutureOr<void> handleAuthorized(
      AuthorizeEvent event, Emitter<AppState> emit) {
    emit(AuthorizedState(_router, event.user));
  }

  FutureOr<void> handleError(ErrorEvent event, Emitter<AppState> emit) {
    emit(ErrorState(_router, event.errorMessage));
  }
}

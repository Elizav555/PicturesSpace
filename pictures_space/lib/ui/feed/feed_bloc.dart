import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../domain/auth_manager.dart';
import 'feed_events.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final AuthManager _authManager;

  FeedBloc(this._authManager) : super(LoadingState()) {
    _authManager.getUserStream().listen((data) => add(HasDataEvent(data)));
    on<HasDataEvent>(handleNewData);
    on<GoToPostEvent>(goToPost);
  }

  FutureOr<void> goToPost(GoToPostEvent event, Emitter<FeedState> emit) {}

  FutureOr<void> handleNewData(HasDataEvent event, Emitter<FeedState> emit) {
    emit(LoadedState(event.user));
  }
}

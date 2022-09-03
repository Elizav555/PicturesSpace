import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../domain/auth_manager.dart';
import '../../domain/pictures_space_repository.dart';
import 'feed_events.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final AuthManager _authManager;
  final PicturesSpaceRep _rep;

  FeedBloc(this._authManager, this._rep) : super(LoadingState()) {
    final userId = _authManager.getCurrentUser()!.uid; //TODO if user null error
    _rep.getAllPostsStream(userId).listen((data) => add(HasDataEvent(data)));
    on<HasDataEvent>(handleNewData);
    on<GoToPostEvent>(goToPost);
  }

  FutureOr<void> goToPost(GoToPostEvent event, Emitter<FeedState> emit) {}

  FutureOr<void> handleNewData(HasDataEvent event, Emitter<FeedState> emit) {
    emit(LoadedState(event.posts));
  }
}

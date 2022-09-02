import 'package:firebase_auth/firebase_auth.dart';

abstract class FeedState {}

class LoadingState extends FeedState {}

class LoadedState extends FeedState {
  final User? user;

  LoadedState(this.user);
}

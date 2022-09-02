import 'package:firebase_auth/firebase_auth.dart';

abstract class FeedEvent {}

class HasDataEvent extends FeedEvent {
  final User? user;

  HasDataEvent(this.user);
}

class GoToPostEvent extends FeedEvent {}

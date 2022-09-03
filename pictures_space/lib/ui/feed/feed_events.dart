import '../../domain/model/post.dart';

abstract class FeedEvent {}

class HasDataEvent extends FeedEvent {
  final List<Post> posts;

  HasDataEvent(this.posts);
}

class GoToPostEvent extends FeedEvent {}

import '../../domain/model/post.dart';

abstract class FeedState {}

class LoadingState extends FeedState {}

class LoadedState extends FeedState {
  final List<Post> posts;

  LoadedState(this.posts);
}

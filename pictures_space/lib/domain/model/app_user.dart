import 'package:pictures_space/domain/model/post.dart';

class AppUser {
  final String id;
  final String name;
  final String email;
  final List<Post> posts;

  AppUser(
      {required this.id,
      required this.name,
      required this.email,
      this.posts = const []});
}

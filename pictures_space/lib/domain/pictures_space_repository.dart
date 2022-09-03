import 'package:pictures_space/domain/db/posts_db.dart';
import 'package:pictures_space/domain/db/users_db.dart';
import 'package:pictures_space/domain/pictures_storage.dart';

import 'model/app_user.dart';
import 'model/post.dart';

abstract class PicturesSpaceRep {
  final UsersDatabase usersDatabase;
  final PostsDatabase postsDatabase;
  final PicturesStorage storage;

  PicturesSpaceRep(this.usersDatabase, this.postsDatabase, this.storage);

  Stream<List<AppUser>> getAllUsersStream();

  Future<AppUser?> getUser(String id);

  Future<void> addUser(AppUser user);

  Future<void> deleteUser(String id);

  Future<void> updateUser(String id, Map<String, dynamic> changes);

  Stream<List<Post>> getAllPostsStream(String userId);

  Future<List<Post>> getAllPosts(String userId);

  Future<String> addPost(String userId, Post newPost);

  Future<void> updatePost(
      String userId, String id, Map<String, dynamic> changes);

  Future<Post> getPost(String userId, String id);

  Future<void> deletePost(String userId, String id);

  Future<String?> addImage(String path, String name);

  Future<void> deleteImage(String url);
}

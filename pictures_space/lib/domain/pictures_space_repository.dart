import 'package:pictures_space/domain/pictures_storage.dart';
import 'package:pictures_space/domain/posts_db.dart';
import 'package:pictures_space/domain/users_db.dart';

import 'model/app_user.dart';
import 'model/post.dart';

abstract class PicturesSpaceRep {
  final UsersDb usersDb;
  final PostsDb postsDb;
  final PicturesStorage storage;

  PicturesSpaceRep(this.usersDb, this.postsDb, this.storage);

  Stream<List<AppUser>> getAllUsersStream();

  Future<AppUser> getUser(String id);

  Future<void> addUser(AppUser user);

  Future<void> deleteUser(String id);

  Future<void> updateUser(String id, Map<String, dynamic> changes);

  Stream<List<Post>> getAllPostsStream(String userId);

  Future<String> addPost(String userId, Post newPost);

  Future<void> updatePost(String id, Map<String, dynamic> changes);

  Future<Post> getPost(String id);

  Future<void> deletePost(String userId, String id);
}

import 'dart:io';

import 'package:pictures_space/domain/pictures_storage.dart';
import 'package:pictures_space/domain/posts_db.dart';
import 'package:pictures_space/domain/users_db.dart';

import 'model/app_user.dart';
import 'model/post.dart';

abstract class PicturesSpaceRep {
  final UsersDb usersDatabase;
  final PostsDb postsDatabase;
  final PicturesStorage storage;

  PicturesSpaceRep(this.usersDatabase, this.postsDatabase, this.storage);

  Stream<List<AppUser>> getAllUsersStream();

  Future<AppUser?> getUser(String id);

  Future<void> addUser(AppUser user);

  Future<void> deleteUser(String id);

  Future<void> updateUser(String id, Map<String, dynamic> changes);

  Stream<List<Post>> getAllPostsStream(String userId);

  Future<String> addPost(String userId, Post newPost);

  Future<void> updatePost(
      String userId, String id, Map<String, dynamic> changes);

  Future<Post> getPost(String userId, String id);

  Future<void> deletePost(String userId, String id);

  Future<String?> addImage(File newPicture, String name);

  Future<void> deleteImage(String url);
}

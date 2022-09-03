import 'package:pictures_space/data/mappers/users_mapper.dart';
import 'package:pictures_space/domain/model/app_user.dart';
import 'package:pictures_space/domain/model/post.dart';
import 'package:pictures_space/domain/pictures_space_repository.dart';

import 'model/user_db.dart';

class PicturesSpaceRepImpl extends PicturesSpaceRep {
  PicturesSpaceRepImpl(super.usersDb, super.postsDb, super.storage);

  @override
  Future<String> addPost(String userId, Post newPost) async {
    return postsDatabase.addPost(userId, newPost);
  }

  @override
  Future<void> addUser(AppUser user) {
    return usersDatabase.addUser(user);
  }

  @override
  Future<void> deletePost(String userId, String id) {
    return postsDatabase.deletePost(userId, id);
  }

  @override
  Future<void> deleteUser(String id) {
    return usersDatabase.deleteUser(id);
  }

  @override
  Stream<List<Post>> getAllPostsStream(String userId) {
    return postsDatabase.getAllPostsStream(userId);
  }

  @override
  Stream<List<AppUser>> getAllUsersStream() {
    final usersDbStream = usersDatabase.getAllUsersStream();
    return usersDbStream.asyncMap((usersDb) => _convertUsers(usersDb));
  }

  Future<List<AppUser>> _convertUsers(List<UserDb> usersDb) async {
    List<AppUser> users = [];
    for (final userDb in usersDb) {
      final user = await _convertUser(userDb);
      if (user != null) {
        users.add(user);
      }
    }
    return users;
  }

  Future<AppUser?> _convertUser(UserDb userDb) async {
    if (userDb.id == null) {
      return null;
    }
    List<Post> posts = await postsDatabase.getAllPosts(userDb.id!);
    return UsersMapper.mapUserFromDb(userDb.id!, userDb, posts);
  }

  @override
  Future<Post> getPost(String userId, String id) {
    return postsDatabase.getPost(userId, id);
  }

  @override
  Future<AppUser?> getUser(String id) async {
    final userDb = await usersDatabase.getUser(id);
    if (userDb == null) {
      return null;
    }
    return _convertUser(userDb);
  }

  @override
  Future<void> updatePost(
      String userId, String id, Map<String, dynamic> changes) {
    return postsDatabase.updatePost(userId, id, changes);
  }

  @override
  Future<void> updateUser(String id, Map<String, dynamic> changes) {
    return usersDatabase.updateUser(id, changes);
  }

  @override
  Future<String?> addImage(String path, String name) {
    return storage.addImage(path, name);
  }

  @override
  Future<void> deleteImage(String url) {
    return storage.deleteImage(url);
  }

  @override
  Future<List<Post>> getAllPosts(String userId) {
    return postsDatabase.getAllPosts(userId);
  }
}

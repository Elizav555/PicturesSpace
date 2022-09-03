import 'package:pictures_space/data/mappers/users_mapper.dart';
import 'package:pictures_space/domain/model/app_user.dart';
import 'package:pictures_space/domain/model/post.dart';
import 'package:pictures_space/domain/pictures_space_repository.dart';

class PicturesSpaceRepImpl extends PicturesSpaceRep {
  PicturesSpaceRepImpl(super.usersDb, super.postsDb, super.storage);

  @override
  Future<String> addPost(String userId, Post newPost) {
    return postsDb.addPost(userId, newPost);
  }

  @override
  Future<void> addUser(AppUser user) {
    return usersDb.addUser(user);
  }

  @override
  Future<void> deletePost(String userId, String id) {
    return postsDb.deletePost(userId, id);
  }

  @override
  Future<void> deleteUser(String id) {
    return usersDb.deleteUser(id);
  }

  @override
  Stream<List<Post>> getAllPostsStream(String userId) {
    return postsDb.getAllPostsStream(userId);
  }

  @override
  Stream<List<AppUser>> getAllUsersStream() {
    final usersDbStream = usersDb.getAllUsersStream();
    return usersDbStream
        .map((usersDb) async => await usersDb.map((userDb) async {
              final posts = await postsDb.getAllPosts(userId);
              return UsersMapper.mapUserFromDb(userDb.id, userDb, posts);
            }).toList());
  }

  @override
  Future<Post> getPost(String id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<AppUser> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(String id, Map<String, dynamic> changes) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(String id, Map<String, dynamic> changes) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

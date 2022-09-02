import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/app_user.dart';
import 'model/post.dart';

abstract class FirestoreDb {
  Stream<List<Post>> getAllUsersStream();

  Future<AppUser> getUser(String id);

  Future<void> addUser(AppUser user);

  Future<void> deleteUser(String id);

  Stream<List<Post>> getAllPostsStream(String userId);

  Future<String> addPost(String userId, Post newPost);

  Future<void> updatePost(String id, Map<String, dynamic> changes);

  Future<Post> getPost(String id);

  Future<void> deletePost(String id);

  final FirebaseFirestore firestore;

  FirestoreDb(this.firestore);
}

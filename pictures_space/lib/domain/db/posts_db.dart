import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/post.dart';

abstract class PostsDatabase {
  Stream<List<Post>> getAllPostsStream(String userId);

  Future<List<Post>> getAllPosts(String userId);

  Future<String> addPost(String userId, Post newPost);

  Future<void> updatePost(
      String userId, String id, Map<String, dynamic> changes);

  Future<Post> getPost(String userId, String id);

  Future<void> deletePost(String userId, String id);

  final FirebaseFirestore firestore;

  PostsDatabase(this.firestore);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pictures_space/data/mappers/posts_mapper.dart';
import 'package:pictures_space/data/model/post_db.dart';
import 'package:pictures_space/domain/db/posts_db.dart';
import 'package:pictures_space/domain/model/post.dart';

class PostsDbImpl extends PostsDatabase {
  PostsDbImpl(super.firestore);

  static const _kpostsCollection = 'posts';
  static const _kusersCollection = 'clients';
  late final CollectionReference _usersCollection =
      firestore.collection(_kusersCollection);

  @override
  Future<String> addPost(String userId, Post newPost) {
    final postsRef = _usersCollection
        .doc(userId)
        .collection(_kpostsCollection)
        .withConverter<PostDb>(
            //TODO ask can i remove this
            fromFirestore: (snapshot, _) => PostDb.fromJSON(snapshot.data()!),
            toFirestore: (item, _) => item.toJSON());
    return postsRef
        .add(PostsMapper.mapPostToDb(newPost))
        .then((DocumentReference doc) => doc.id);
  }

  @override
  Future<void> deletePost(String userId, String id) async {
    final postsRef = _usersCollection.doc(userId).collection(_kpostsCollection);
    return postsRef.doc(id).delete();
  }

  @override
  Stream<List<Post>> getAllPostsStream(String userId) {
    final postsRef = _usersCollection
        .doc(userId)
        .collection(_kpostsCollection)
        .withConverter<PostDb>(
            //TODO ask can i remove this
            fromFirestore: (snapshot, _) => PostDb.fromJSON(snapshot.data()!),
            toFirestore: (item, _) => item.toJSON());
    return postsRef.snapshots().map((event) => event.docs
        .map((e) => PostsMapper.mapPostFromDb(e.id, e.data()))
        .toList());
  }

  @override
  Future<Post> getPost(String userId, String id) async {
    final postsRef = _usersCollection
        .doc(userId)
        .collection(_kpostsCollection)
        .withConverter<PostDb>(
            //TODO ask can i remove this
            fromFirestore: (snapshot, _) => PostDb.fromJSON(snapshot.data()!),
            toFirestore: (item, _) => item.toJSON());
    final snapshot = await postsRef.doc(id).get();
    return PostsMapper.mapPostFromDb(snapshot.id, snapshot.data()!);
  }

  @override
  Future<void> updatePost(
      String userId, String id, Map<String, dynamic> changes) {
    final postsRef = _usersCollection.doc(userId).collection(_kpostsCollection);
    return postsRef.doc(id).update(changes);
  }

  @override
  Future<List<Post>> getAllPosts(String userId) async {
    final postsRef = _usersCollection
        .doc(userId)
        .collection(_kpostsCollection)
        .withConverter<PostDb>(
            //TODO ask can i remove this
            fromFirestore: (snapshot, _) => PostDb.fromJSON(snapshot.data()!),
            toFirestore: (item, _) => item.toJSON());
    final posts = await postsRef.get().then((value) => value.docs
        .map((snapshot) =>
            PostsMapper.mapPostFromDb(snapshot.id, snapshot.data()))
        .toList());
    return posts;
  }
}

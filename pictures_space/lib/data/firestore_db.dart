import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pictures_space/domain/firestore_db.dart';
import 'package:pictures_space/domain/model/post.dart';

class FirestoreDbImpl extends FirestoreDb {
  FirestoreDbImpl(super.firestore);

  static const _usersCollection = 'users';
  static const _postsCollection = 'posts';
  late final CollectionReference<Post> _shoppingListCollection = firestore
      .collection(_kcollection)
      .withConverter<BuyItemDB>(
          fromFirestore: (snapshot, _) => BuyItemDB.fromJSON(snapshot.data()!),
          toFirestore: (item, _) => item.toJSON());

  @override
  Future<String> addBuyItem(String itemName) async {
    final dbItem = BuyItemDB(name: itemName);
    return _shoppingListCollection
        .add(dbItem)
        .then((DocumentReference doc) => doc.id);
  }

  @override
  Future<void> updateBuyItem(String id, Map<String, dynamic> changes) =>
      _shoppingListCollection.doc(id).update(changes);

  @override
  Stream<List<BuyItem>> getAllItemsStream() =>
      _shoppingListCollection.snapshots().map((event) => event.docs
          .map((e) => BuyItemsMapper.mapBuyItemFromDB(e.id, e.data()))
          .toList());

  Future<List<Pair<String, BuyItemDB>>> getAllItems() =>
      _shoppingListCollection.get().then((value) =>
          value.docs.map((e) => Pair(key: e.id, value: e.data())).toList());

  @override
  Future<BuyItem> getBuyItem(String id) async {
    final snapshot = await _shoppingListCollection.doc(id).get();
    return BuyItemsMapper.mapBuyItemFromDB(snapshot.id, snapshot.data()!);
  }

  @override
  Future<String> addPost(String userId, Post newPost) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> getAllPostsStream(String userId) {
    // TODO: implement getAllPostsStream
    throw UnimplementedError();
  }

  @override
  Future<Post> getPost(String id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(String id, Map<String, dynamic> changes) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}

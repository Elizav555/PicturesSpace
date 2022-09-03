import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pictures_space/domain/model/app_user.dart';

import '../domain/users_db.dart';
import 'mappers/users_mapper.dart';
import 'model/user_db.dart';

class UsersDbImpl extends UsersDb {
  UsersDbImpl(super.firestore);

  static const _kusersCollection = 'clients';
  late final CollectionReference<UserDb> _usersRef = firestore
      .collection(_kusersCollection)
      .withConverter<UserDb>(
          fromFirestore: (snapshot, _) => UserDb.fromJSON(snapshot.data()!),
          toFirestore: (item, _) => item.toJSON());

  @override
  Future<void> addUser(AppUser user) {
    return _usersRef
        .add(UsersMapper.mapUserToDb(user))
        .then((DocumentReference doc) => doc.id);
  }

  @override
  Future<void> deleteUser(String id) {
    return _usersRef.doc(id).delete();
  }

  @override
  Stream<List<UserDb>> getAllUsersStream() {
    return _usersRef.snapshots().map((event) => event.docs
        .map((e) => UserDb(
            id: e.id,
            name: e.data().name,
            email: e.data().email,
            postsIds: e.data().postsIds))
        .toList());
  }

  @override
  Future<UserDb?> getUser(String id) async {
    final snapshot = await _usersRef.doc(id).get();
    return snapshot.data() != null
        ? UserDb(name: snapshot.data()!.name, email: snapshot.data()!.email)
        : null;
  }

  @override
  Future<void> updateUser(String id, Map<String, dynamic> changes) {
    return _usersRef.doc(id).update(changes);
  }
}

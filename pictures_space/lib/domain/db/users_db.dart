import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/model/user_db.dart';
import '../model/app_user.dart';

abstract class UsersDatabase {
  Stream<List<UserDb>> getAllUsersStream();

  Future<UserDb?> getUser(String id);

  Future<void> addUser(AppUser user);

  Future<void> deleteUser(String id);

  Future<void> updateUser(String id, Map<String, dynamic> changes);

  final FirebaseFirestore firestore;

  UsersDatabase(this.firestore);
}

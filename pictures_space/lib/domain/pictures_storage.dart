import 'package:firebase_storage/firebase_storage.dart';

abstract class PicturesStorage {
  Future<String?> addImage(String path, String name);

  Future<void> deleteImage(String url);

  final FirebaseStorage storage;

  PicturesStorage(this.storage);
}

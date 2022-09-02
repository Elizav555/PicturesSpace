import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';

abstract class PicturesStorage {
  Future<String> addImage(File newPicture);

  Future<void> deleteImage(String url);

  final FirebaseStorage storage;

  PicturesStorage(this.storage);
}

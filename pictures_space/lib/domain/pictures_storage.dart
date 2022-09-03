import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class PicturesStorage {
  Future<String?> addImage(File newPicture, String name);

  Future<void> deleteImage(String url);

  final FirebaseStorage storage;

  PicturesStorage(this.storage);
}

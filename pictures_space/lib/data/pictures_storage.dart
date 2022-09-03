import 'dart:io';

import 'package:pictures_space/domain/pictures_storage.dart';

class PicturesStorageImpl extends PicturesStorage {
  PicturesStorageImpl(super.storage);

  late final _storageRef = storage.ref();

  @override
  Future<String?> addImage(File newPicture, String name) async {
    final newImageRef = _storageRef.child(name);
    try {
      await newImageRef.putFile(newPicture);
      return newImageRef.getDownloadURL();
    } catch (e) {
      //todo handle
    }
    return null;
  }

  @override
  Future<void> deleteImage(String url) {
    return _storageRef.child(url).delete();
  }
}

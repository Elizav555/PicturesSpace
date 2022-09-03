import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pictures_space/domain/pictures_storage.dart';

class PicturesStorageImpl extends PicturesStorage {
  PicturesStorageImpl(super.storage);

  late final _storageRef = storage.ref();

  @override
  Future<String?> addImage(String path, String name) async {
    // String path = selectPicture(ImageSource.gallery);
    Uint8List imageData = await XFile(path).readAsBytes();
    final newImageRef = _storageRef.child(name);
    try {
      await newImageRef.putData(imageData);
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

  Future<String?> selectPicture(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(
      source: source,
      maxHeight: 1000,
      maxWidth: 1000,
    );

    return image?.path;
  }
}

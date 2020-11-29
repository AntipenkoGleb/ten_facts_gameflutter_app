import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

abstract class StorageRepository {
  Future<File> getFile(String filename);
}

class FirebaseStorageRepository implements StorageRepository {
  Future<File> _downloadAndSave(String filename) async {
    final saveDirectory = await _saveDirectory();

    File downloadToFile = File(saveDirectory + filename);

    try {
      await FirebaseStorage.instance
          .ref("/images/$filename")
          .writeToFile(downloadToFile);
    } catch (e) {
      print(e.toString());
      return null;
    }

    return downloadToFile;
  }

  @override
  Future<File> getFile(String filename) async {
    final directory = await _saveDirectory();
    final file = File(directory + filename);
    return await file.exists() ? file : await _downloadAndSave(filename);
  }

  Future<String> _saveDirectory() async {
    final directory = await getTemporaryDirectory();
    return "${directory.path}/";
  }
}

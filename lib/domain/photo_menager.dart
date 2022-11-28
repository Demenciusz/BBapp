import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_st;

class PhotoMenager {
  final firebase_st.FirebaseStorage storage =
      firebase_st.FirebaseStorage.instance;

  Future<void> uploadPhoto(String photoPath, String uid) async {
    File file = File(photoPath);
    try {
      await storage.ref('profileP/$uid').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> displayPhoto(String uid) async {
    try {
      String result = await storage.ref('profileP/$uid').getDownloadURL();
      print(result);
      return result;
    } catch (e) {
      return 'Error';
    }
  }
}

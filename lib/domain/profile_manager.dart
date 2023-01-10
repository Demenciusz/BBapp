import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:zaliczenie/domain/photo_manager.dart';

class ProfileMenager {
  Future<FilePickerResult?> pickPhoto() async {
    final profilePhoto = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg']);
    return profilePhoto;
  }

  Future<void> editPhoto({
    required String uid,
    required FilePickerResult? result,
  }) async {
    PhotoManager photoManager = PhotoManager();
    if (result == null) {
    } else {
      final path = result.files.single.path;
      photoManager.uploadPhoto(path!, uid);
    }
  }

  Future<void> editProfilDescription({
    required String uid,
    required String description,
  }) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'description': description});
  }

  Future<Map<String, dynamic>> displayInfo({required String uid}) async {
    var data;
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .get()
          .then((DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;
      });
    } catch (e) {}
    return data;
  }

  Future<void> editUserName({
    required String name,
    required String uid,
  }) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'name': name});
  }
}

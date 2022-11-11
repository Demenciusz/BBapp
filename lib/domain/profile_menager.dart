import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:zaliczenie/domain/photo_menager.dart';

class ProfileMenager {
  Future<void> editPhoto({
    required String uid,
  }) async {
    PhotoMenager photoMenager = PhotoMenager();
    final profilePhoto = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg']);
    if (profilePhoto == null) {
    } else {
      final path = profilePhoto.files.single.path;
      photoMenager.uploadPhoto(path!, uid);
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

  Future<void> editUserName() async {}
  Future<void> editUserEmail() async {}
  Future<void> editUserBirth() async {}
  Future<void> editUserDescription() async {}
}

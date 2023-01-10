import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterManager {
  static Future<void> addCharacter(
    String uid,
    String game,
    String name,
    String id,
  ) async {
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection('Char')
        .doc(id)
        .set({
      'id': id,
      'name': name,
      'game': game,
    });
  }

  static Future<void> deleteCharacter(
    String uid,
    String id,
  ) async {
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection('Char')
        .doc(id)
        .delete();
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('About')
        .delete();
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Stats')
        .delete();
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Eq')
        .delete();
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Skills')
        .delete();
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Weapons')
        .delete();
  }
}

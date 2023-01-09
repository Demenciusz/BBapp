import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zaliczenie/domain/id_time.dart';

class CharacterManager {
  Map<String, String> about = {};
  Map<String, String> stats = {};
  Map<String, String> skills = {};
  Map<String, String> eq = {};
  Map<String, String> weapons = {};
  static Future<void> addCharacter(
    String uid,
    String game,
    String name,
    Map<String, String> map,
  ) async {
    String id = IdTime.idByTime();
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
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('About')
        .set(map);
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Stats')
        .set(map);
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Eq')
        .set(map);
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Skills')
        .set(map);
    await FirebaseFirestore.instance
        .collection('Characters')
        .doc(uid)
        .collection(id)
        .doc('Weapons')
        .set(map);
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zaliczenie/domain/id_time.dart';

class ChatManager {
  static void getMessages() async {
    final messages =
        await FirebaseFirestore.instance.collection('Messages').get();
    for (var messages in messages.docs) {
      print(messages.data());
    }
  }

  static void streamMessages() async {
    await for (var snapshot
        in FirebaseFirestore.instance.collection('Messages').snapshots()) {
      for (var messages in snapshot.docs) {
        print(messages.data());
      }
    }
  }

  static Future<void> sendMessage(
    String text,
    String sender,
    String userName,
  ) async {
    String id = IdTime.idByTime();
    FirebaseFirestore.instance.collection('Messages').doc(id).set({
      'text': text,
      'sender': sender,
      'name': userName,
      'id': id,
    });
  }
}

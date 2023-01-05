import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month;
    String day;
    String hour;
    String min;
    String sec;
    //month
    now.month <= 9
        ? month = '0' + now.month.toString()
        : month = now.month.toString();
    //day
    now.day <= 9 ? day = '0' + now.day.toString() : day = now.day.toString();
    //hour
    now.hour <= 9
        ? hour = '0' + now.hour.toString()
        : hour = now.hour.toString();
    //min
    now.minute <= 9
        ? min = '0' + now.minute.toString()
        : min = now.minute.toString();
    //sec
    now.second <= 9
        ? sec = '0' + now.second.toString()
        : sec = now.second.toString();
    String id = year + month + day + hour + min + sec;
    FirebaseFirestore.instance.collection('Messages').doc(id).set({
      'text': text,
      'sender': sender,
      'name': userName,
      'id': id,
    });
  }
}

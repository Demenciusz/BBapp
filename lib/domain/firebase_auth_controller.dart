import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthController {
  Future signIn(
      {required String email,
      required String password,
      required BuildContext context,
      required String title,
      required content}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: Text('OK'))
                ],
              )));
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future register({
    required String email,
    required String password,
    required String name,
    required String birth,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final String myUid = user!.uid;
      userProfilData(name: name, birth: birth, email: email, uid: myUid);
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future userProfilData(
      {required String name,
      required String birth,
      required String email,
      required String uid}) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(uid).set(
          {'name': name, 'birth': birth, 'email': email, 'description': ''});
    } catch (e) {}
  }
}
/*await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String myUid = user!.uid;
    userProfilData(name: name, birth: birth, email: email, uid: myUid); */
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/profile_menager.dart';
import 'package:zaliczenie/pages/2profilePage/widgets/profileDescription.dart';

import 'package:zaliczenie/pages/2profilePage/widgets/profilePhoto.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final User? user;
  late final String uid;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    uid = user!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      drawer: MyDrawer(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePhoto(
              width: MediaQuery.of(context).size.width * 0.2,
              uid: uid,
            ),
            TextButton(
              child: Text('Zmien'),
              onPressed: () => ProfileMenager().editPhoto(
                uid: uid,
              ),
            ),
            ProfileDescription(uid: uid),
            TextButton(
                onPressed: () async {
                  final instance = FirebaseFirestore.instance;
                  CollectionReference col = instance.collection('Users');
                  DocumentSnapshot snapshot = await col.doc(uid).get();
                  var data = snapshot.data() as Map;
                  print(data['description']);
                },
                child: Text('poka'))
          ],
        ),
      ),
    );
  }
}

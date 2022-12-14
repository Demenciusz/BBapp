import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/page/page_cubit.dart';
import 'package:zaliczenie/domain/photo_manager.dart';

import 'package:zaliczenie/pages/2profilePage/widgets/profileInfo.dart';

import 'package:zaliczenie/pages/2profilePage/widgets/profilePhoto.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';
import 'package:zaliczenie/pages/widgets/floating_button.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.uid});
  final String uid;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PageCubit>(context).profilePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      drawer: MyDrawer(),
      floatingActionButton: MyFloatingButton(
        icon: Icons.edit_note,
        function: () async {
          final instance = FirebaseFirestore.instance;
          CollectionReference col = instance.collection('Users');
          DocumentSnapshot snapshot = await col.doc(widget.uid).get();
          var data = snapshot.data() as Map;
          String oldDescription = data['description'];
          String oldName = data['name'];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocHelper(
                name: oldName,
                uid: widget.uid,
                description: oldDescription,
              ),
            ),
          ).then((value) async {
            PhotoManager manager = PhotoManager();
            await manager.displayPhoto(widget.uid);
            setState(() {});
          });
        },
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProfilePhoto(
                  width: MediaQuery.of(context).size.width * 0.30,
                  uid: widget.uid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProfileInfo(
                  uid: widget.uid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
TextButton(
                  onPressed: () async {
                    final instance = FirebaseFirestore.instance;
                    CollectionReference col = instance.collection('Users');
                    DocumentSnapshot snapshot = await col.doc(widget.uid).get();
                    var data = snapshot.data() as Map;
                    print(data['description']);
                  },
                  child: Text(
                    'poka',
                  ))
*/
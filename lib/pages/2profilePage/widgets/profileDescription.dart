import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zaliczenie/domain/profile_menager.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({required this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProfileMenager().displayDescription(uid: uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Opis:\n${snapshot.data}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

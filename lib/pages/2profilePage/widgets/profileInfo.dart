import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zaliczenie/domain/profile_menager.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({required this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: ProfileMenager().displayInfo(uid: uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? map = snapshot.data as Map<String, dynamic>?;
            String? name = map!['name'];
            String? description = map['description'];
            String? email = map['email'];
            String? birth = map['birth'];
            print('$map---------------------------------------------');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nazwa: \n$name',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Email: \n$email',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Data urodzenia: \n$birth',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Opis: \n$description',
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

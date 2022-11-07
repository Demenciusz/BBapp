import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/photo_menager.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({required this.width, required this.uid});

  double width;
  String uid;
  PhotoMenager photoStorage = PhotoMenager();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: photoStorage.displayPhoto(uid),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if ((snapshot.connectionState == ConnectionState.done ||
                snapshot.hasData) &&
            snapshot.data != '1') {
          return CircleAvatar(
            radius: width,
            backgroundImage: NetworkImage(snapshot.data!),
          );
        } else if (snapshot.data == '1') {
          return CircleAvatar(
            radius: width,
            child: Text(
              'T',
              style: TextStyle(fontSize: width * 0.5),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

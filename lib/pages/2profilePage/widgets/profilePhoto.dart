import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/photo_manager.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({required this.width, required this.uid});

  double width;
  String uid;
  PhotoManager photoStorage = PhotoManager();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: photoStorage.displayPhoto(uid),
      builder: (context, AsyncSnapshot<String> snapshot) {
        try {
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
        } catch (e) {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

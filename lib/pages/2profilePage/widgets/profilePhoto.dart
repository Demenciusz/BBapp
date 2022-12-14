import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/photo_manager.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({required this.width, required this.uid});

  final double width;
  final String uid;
  final PhotoManager photoStorage = PhotoManager();
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
        return const SizedBox(
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          width: 50,
          height: 50,
        );
      },
    );
  }
}

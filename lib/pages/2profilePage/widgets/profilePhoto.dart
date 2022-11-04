import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({required this.width});

  double width;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width,
      child: Text(
        'T',
        style: TextStyle(fontSize: width * 0.5),
      ),
    );
  }
}

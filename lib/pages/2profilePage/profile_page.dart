import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/2profilePage/widgets/profilePhoto.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            ProfilePhoto(width: MediaQuery.of(context).size.width * 0.2),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/video.dart';
import 'package:zaliczenie/pages/1homePage/widgets/video_list.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

import '../../domain/firebase_auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strona główna'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VideoList(height: 480),
            ],
          ),
        ),
      ),
    );
  }
}

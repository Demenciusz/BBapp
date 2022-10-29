import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/video.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

import '../../domain/firebase_auth_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('elo'),
              TextButton(
                  onPressed: () async {
                    await AuthController().signOut();
                  },
                  child: Text('nara'))
            ],
          ),
        ),
      ),
    );
  }
}

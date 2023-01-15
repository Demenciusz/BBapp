import 'package:flutter/material.dart';
import 'package:zaliczenie/constants.dart';

import 'package:zaliczenie/pages/1homePage/widgets/video_list.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

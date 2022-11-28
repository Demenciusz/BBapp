import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shake/shake.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';

class DicePage extends StatefulWidget {
  DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  ShakeDetector detector = ShakeDetector.autoStart(
    onPhoneShake: () {
      print('eeee');
    },
    shakeSlopTimeMS: 10000,
  );
  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}

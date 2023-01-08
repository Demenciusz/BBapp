import 'package:flutter/material.dart';
import 'package:zaliczenie/pages/2profilePage/widgets/profileInfo.dart';
import 'package:zaliczenie/pages/2profilePage/widgets/profilePhoto.dart';

class SenderPage extends StatefulWidget {
  const SenderPage({
    super.key,
    required this.uid,
  });
  final String uid;

  @override
  State<SenderPage> createState() => _SenderPageState();
}

class _SenderPageState extends State<SenderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProfilePhoto(
                  width: MediaQuery.of(context).size.width * 0.30,
                  uid: widget.uid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProfileInfo(
                  uid: widget.uid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

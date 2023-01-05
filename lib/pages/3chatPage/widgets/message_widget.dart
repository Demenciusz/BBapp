import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.text,
    required this.sender,
    required this.userEmail,
    required this.userName,
    required this.id,
  });
  final String text;
  final String sender;
  final String userEmail;
  final String userName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return sender == userEmail
        ? GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: ((context) => AlertDialog(
                        title: Text('Usuń'),
                        content: Text(text),
                        actions: [
                          TextButton(
                              onPressed: (() async {
                                await FirebaseFirestore.instance
                                    .collection('Messages')
                                    .doc(id)
                                    .delete()
                                    .then((value) => Navigator.pop(context),
                                        onError: (e) => print(
                                            "Error updating document $e"));
                                /*
                                
                                            
                                            */
                              }),
                              child: Text('USUŃ'))
                        ],
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(userName),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE4E6EB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    )
                  ],
                ),
              ],
            ),
          );
  }
}

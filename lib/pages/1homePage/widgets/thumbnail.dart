import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/video_manager.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    required this.link,
    required this.size,
    required this.thumnbailUrl,
    required this.title,
  });
  final String link;
  final String thumnbailUrl;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * 0.93,
      height: 300,
      child: Column(
        children: [
          GestureDetector(
            onLongPress: () => VideoListManager.openVideo(link),
            //onTap: () => VideoListMenager.openVideo(link),
            child: Image.network(
              height: 300,
              thumnbailUrl,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/video.dart';
import 'package:zaliczenie/domain/video_manager.dart';
import 'package:zaliczenie/pages/1homePage/widgets/thumbnail.dart';

class VideoList extends StatelessWidget {
  const VideoList({required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.8,
      child: FutureBuilder<List<Video>>(
          future: VideoListManager.makeList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Video> video = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: video.length,
                    itemBuilder: (co, index) {
                      return Thumbnail(
                        link: video[index].getLink(),
                        size: MediaQuery.of(context).size.width,
                        thumnbailUrl: video[index].getThumnbailUrl(),
                        title: video[index].getTitle(),
                      );
                    },
                  ),
                ),
              );
            } else
              return Center(
                  child: SizedBox(
                child: const CircularProgressIndicator(
                  color: Colors.red,
                ),
                width: 100,
                height: 100,
              ));
          }),
    );
  }
}

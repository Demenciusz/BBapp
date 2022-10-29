import 'package:url_launcher/url_launcher.dart';
import 'package:xml/xml.dart';
import 'package:zaliczenie/domain/video.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class VideoListMenager {
  Future<List<Video>> makeList() async {
    Uri url = Uri.parse(ytUrl);
    http.Response response = await http.get(url);
    List<Video> videos = [];
    if (response.statusCode == 200) {
      final xmlData = XmlDocument.parse(response.body);
      for (var entry in xmlData.findAllElements('entry')) {
        String title = entry.getElement('title')!.innerText;
        String link = entry.getElement('yt:videoId')!.innerText;
        String? thumnbailUrl = entry
            .getElement('media:group')!
            .getElement('media:thumbnail')!
            .getAttribute('url');
        Video video = Video(
          link: link,
          title: title,
          thumnbailUrl: thumnbailUrl!,
        );
        videos.add(video);
      }
    }
    return videos;
  }

  void openVideo(String link) async {
    Uri uri = Uri.parse('https://www.youtube.com/watch?v=' + link);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $link';
    }
  }
}

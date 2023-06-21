import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../repository/lecture_repository.dart';

class LectureController extends GetxController {
  final LectureRepository repository;

  LectureController({required this.repository});

  Future<List<dynamic>> fetchVideoList(String videoName) {
    return repository.fetchVideoList(videoName);
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

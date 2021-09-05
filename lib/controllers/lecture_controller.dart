import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:http/http.dart' as http;
import 'package:the_platform/constants.dart' as con;
import 'package:the_platform/models/lecture_model.dart';
import 'package:the_platform/ui/LecturePage.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class LectureController extends GetxController {
  var studentController = Get.find<StudentController>();
  var isLoading = false.obs;
  Future showLecture(lectureId) async {
    isLoading(true);
    final response = await http.get(Uri.parse(con.showLecturesUrl(lectureId)),
        headers: requestHeadersWithAuth(studentController.user['token']));
    print(
        "Showing Lecture Details.. Sent:\nNothing \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    isLoading(false);
    LectureModel lecturemodel =
        LectureModel.fromJson(json.decode(response.body));

    // TODO: real video link
    String videoLink = baseUrl + lecturemodel.lecture.video;
    Get.to(() => Home(videoLink: videoLink), arguments: lecturemodel);
    return response.statusCode;
  }

  Future downloadLecture(lectureId) async {
    var url = downloadLecturesUrl(lectureId);
    if (await canLaunch(url))
      await launch(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }
}

import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:http/http.dart' as http;
import 'package:the_platform/models/semester_model.dart' as model;
import 'package:the_platform/ui/semester.dart';

class SemestersController extends GetxController {
  var studentController = Get.find<StudentController>();
  var isLoading = false.obs;

  Future showSemester(semesterCount) async {
    var link = baseSemesters + semesterCount.toString();

    isLoading(true);
    final response = await http.get(Uri.parse(link),
        headers: requestHeadersWithAuth(studentController.user['token']));
    print(response.request.headers);
    print(
        "Showing Semester Courses.. Sent:\nNothing \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    isLoading(false);
    if (response.statusCode == 200) {
      model.SemesterModel semesterModel =
          model.semesterModelFromJson(response.body);
      Get.to(() => Semester(), arguments: semesterModel);
    } else {
      Get.snackbar("Error", "Status Code : ${response.statusCode}");
    }
    return response.body;
  }
}

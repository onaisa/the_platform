import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:http/http.dart' as http;
import 'package:the_platform/constants.dart' as con;
import 'package:the_platform/models/course_model.dart';
import 'package:the_platform/ui/subject.dart';

class CoursesController extends GetxController {
  var studentController = Get.find<StudentController>();

  var isLoading = false.obs;
  Future showCourses(courseId) async {
    isLoading(true);
    final response = await http.get(Uri.parse(con.showCourses(courseId)),
        headers: requestHeadersWithAuth(studentController.user['token']));
    print(
        "Showing Course Details.. Sent:\nNothing \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    CourseModel courseModel = courseModelFromJson(response.body);
    isLoading(false);
    Get.to(() => Subject(), arguments: courseModel);
    return response.statusCode;
  }
}

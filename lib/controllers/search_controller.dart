import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:http/http.dart' as http;
import 'package:the_platform/controllers/student_controller.dart';

class SearchController extends GetxController {
  var studentController = Get.find<StudentController>();
  var isLoading = false.obs;

  Future searchLectures(query) async {
    isLoading(true);
    final response = await http.get(Uri.parse(searchUrl),
        headers: searchHeadersWithAuth(studentController.user['token'], query));
    // print(response.request.headers);
    print(
        "Showing Year.. Sent:\nNothing \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    isLoading(false);
    if (response.statusCode == 200) {
    } else {
      Get.snackbar("Error", "Status Code : ${response.statusCode}");
    }
    return response.body;
  }
}

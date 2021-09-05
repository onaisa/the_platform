import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:http/http.dart' as http;
import 'package:the_platform/models/year_model.dart' as model;
import 'package:the_platform/ui/year.dart';

class YearsController extends GetxController {
  var studentController = Get.find<StudentController>();
  var isLoading = false.obs;
  Future showYear(yearCount) async {
    isLoading(true);
    final response = await http.get(Uri.parse(showYearsUrl + "/$yearCount"),
        headers: requestHeadersWithAuth(studentController.user['token']));
    print(response.request.headers);
    print(
        "Showing Year.. Sent:\nNothing \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    isLoading(false);
    if (response.statusCode == 200) {
      model.YearModel yearModel = model.yearModelFromJson(response.body);
      Get.to(() => Year(), arguments: yearModel);
    } else {
      Get.snackbar("Error", "Status Code : ${response.statusCode}");
    }
    return response.body;
  }
}

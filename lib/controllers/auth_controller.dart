import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_platform/controllers/student_controller.dart';
import 'package:the_platform/models/user_details_model.dart';
import 'package:the_platform/models/user_model.dart';
import 'package:the_platform/util/sherdpref.dart';
import 'dart:convert';

import '../constants.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  Future register(User usermodel) async {
    isLoading(true);

    final response = await http.post(Uri.parse(registerUrl),
        body: jsonEncode(usermodel.toJson()), headers: requestHeadersNoAuth);
    print(
        "Registering.. Sent:\n ${usermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    isLoading(false);
    return response.statusCode;
  }

  Future<void> login(User user) async {
    isLoading(true);
    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(user.toJson()), headers: requestHeadersNoAuth);
    // print(loginUrl);

    // print(
    //     "Logging in.. Sent:\n ${user.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    // print(response.headers);

    Usermodel usermodel = usermodelFromJson(response.body);
    StorageUtil.getInstance().saveData(usermodel);
    StudentController std = Get.find<StudentController>();
    std.user = await std.getUserData();
    isLoading(false);
    if (response.statusCode == 201) {
      Get.offNamed(await StorageUtil.getInstance().getInitRoute());
    } else {
      Get.snackbar("Error", "status code: ${response.statusCode}");
    }
  }
}

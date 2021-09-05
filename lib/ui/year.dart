import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/controllers/semesters_controller.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:the_platform/ui/widgets/component.dart';

class Year extends GetWidget<SemestersController> {
  var studentController = Get.find<StudentController>();
  Year({Key key, this.index = 0}) : super(key: key);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var userData = studentController.user['user'];
    var yearData = Get.arguments;
    return Scaffold(
      appBar: DefaultAppBar(title: 'Hello ${userData['full_name']}'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Choose Your Semester:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
              ),
              DefaultButton(
                  on_pressed: () async {
                    await controller.showSemester(yearData.semesters[0].id);
                  },
                  buttomname: '1st Semester'),
              SizedBox(
                width: 30,
                height: 30,
              ),
              DefaultButton(
                on_pressed: () async {
                  await controller.showSemester(yearData.semesters[1].id);
                },
                buttomname: '2st Semester',
              ),
              SizedBox(
                width: 30,
                height: 70,
              ),
              Image.asset(
                "assets/images/2st.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomRight,
              ),
              Obx(
                () {
                  if (controller.isLoading.value)
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: LinearProgressIndicator(),
                    );
                  else {
                    return Text('');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: botombar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:the_platform/controllers/years_controller.dart';
import 'package:the_platform/ui/widgets/component.dart';

class Sem extends GetWidget<StudentController> {
  Sem({Key key, this.index = 0}) : super(key: key);
  int index = 0;
  var yearsController = Get.find<YearsController>();
  @override
  Widget build(BuildContext context) {
    var data = controller.user['user'];
    return Scaffold(
      appBar: DefaultAppBar(title: 'Hello ${data['full_name']}'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Browse Academic Years:",
                style: TextStyle(fontSize: 20),
              ),
              DefaultButton(
                  buttomname: '1st',
                  on_pressed: () async {
                    await yearsController.showYear(1);
                  }),
              DefaultButton(
                  buttomname: '2nd',
                  on_pressed: () async {
                    await yearsController.showYear(2);
                  }),
              DefaultButton(
                  buttomname: '3rd',
                  on_pressed: () async {
                    await yearsController.showYear(3);
                  }),
              DefaultButton(
                  buttomname: '4th',
                  on_pressed: () async {
                    await yearsController.showYear(4);
                  }),
              DefaultButton(
                  buttomname: '5th',
                  on_pressed: () async {
                    await yearsController.showYear(5);
                  }),
              Image.asset(
                "assets/images/2st.png",
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomRight,
              ),
              Obx(
                () {
                  if (yearsController.isLoading.value)
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
    );
  }
}

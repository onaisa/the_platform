import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/controllers/courses_controller.dart';
import 'package:the_platform/controllers/lecture_controller.dart';
import 'package:the_platform/models/course_model.dart';
import 'package:the_platform/ui/widgets/component.dart';

import 'LecturePage.dart';

class Subject extends GetWidget<CoursesController> {
  final lectureController = Get.find<LectureController>();
  Subject({Key key}) : super(key: key);
  var courseData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          (courseData.course.name),
          style: TextStyle(color: Color(0xff221f33), fontSize: 26),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffd5b361),
          ),
          //color: Color(0xff3489D4),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Select the lecture number:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 70.0),
                        width: 50,
                        child: DefaultButton(
                            buttomname: 'Lecture ${i + 1}',
                            on_pressed: () async {
                              // await lectureController
                              //     .showLecture(courseData.lectures[i].id);
                              await lectureController
                                  .showLecture(courseData.lectures[i].id);
                            }),
                      ),
                  separatorBuilder: (context, i) => SizedBox(
                        width: 20,
                        height: 20,
                      ),
                  itemCount: courseData.lectures.length),
            ),
          ],
        ),
      ),
    );
  }
}

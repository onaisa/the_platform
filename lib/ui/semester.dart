import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/controllers/courses_controller.dart';
import 'package:the_platform/controllers/semesters_controller.dart';
import 'package:the_platform/models/semester_model.dart';

class Semester extends GetWidget<SemestersController> {
  final courseController = Get.find<CoursesController>();
  Semester({Key key}) : super(key: key);
  var semesterData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    List<Course> courses = semesterData.courses;
    RxList<Course> filteredCourses = RxList<Course>.from(courses);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        //0x11818080
        title: Text(
          ('Semester ${semesterData.semester.id} '),
          style: TextStyle(color: Color(0xffd5b361), fontSize: 26),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (string) {
                  filteredCourses.removeRange(0, filteredCourses.length);
                  for (Course course in courses) {
                    if (course.name
                        .toLowerCase()
                        .contains(string.toLowerCase())) {
                      filteredCourses.add(course);
                    }
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: IconTheme(
                        data: IconThemeData(
                          color: Color(0xffd5b361),
                        ),
                        child: Icon(
                          Icons.search,
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "This semester include these courses: ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
              ),
              Obx(
                () => ListView.builder(
                  itemCount: filteredCourses.length ?? 0,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        title: Text(
                          filteredCourses[index].name,
                          style: TextStyle(color: Colors.indigo),
                        ),
                        leading: FadeInImage(
                            image: NetworkImage(filteredCourses[index].logo),
                            imageErrorBuilder: (BuildContext context,
                                Object exception, StackTrace stackTrace) {
                              return Image.network(
                                  "https://via.placeholder.com/100");
                            },
                            placeholder: NetworkImage(
                                "https://via.placeholder.com/100")),
                        subtitle: Text(filteredCourses[index].description),
                        onTap: () async {
                          // showBottomSheet(
                          //     context: context, builder: (context) => subject());
                          await courseController
                              .showCourses(filteredCourses[index].id);
                          // Get.to(() => Subject(), arguments: semesterData.);
                        },
                      ),
                    );
                  },
                ),
              ),
              Obx(
                () {
                  if (courseController.isLoading.value)
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

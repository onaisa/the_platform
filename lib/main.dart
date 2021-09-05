import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/controllers/auth_controller.dart';
import 'package:the_platform/controllers/courses_controller.dart';
import 'package:the_platform/controllers/semesters_controller.dart';
import 'package:the_platform/controllers/student_controller.dart';
import 'package:the_platform/controllers/years_controller.dart';
import 'package:the_platform/layoutpage/bottombar.dart';
import 'package:the_platform/ui/Reg1.dart';
import 'package:the_platform/ui/intropage.dart';
import 'package:the_platform/ui/pages/profilepage.dart';
import 'package:the_platform/ui/pages/semesters.dart';
import 'package:the_platform/ui/sign_in.dart';
import 'package:the_platform/util/sherdpref.dart';

import 'controllers/lecture_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageUtil storageUtil = StorageUtil.getInstance();
  String inirout = await storageUtil.getInitRoute();
  Get.put(StudentController());
  Get.put(SemestersController());
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => YearsController());
  Get.put(CoursesController());
  Get.put(LectureController());
  runApp(MyApp(inirout: inirout));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.inirout}) : super(key: key);
  String inirout;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: inirout,
      debugShowCheckedModeBanner: false,
      routes: {
        '/intro': (_) => MyHomePage(),
        '/profile': (_) => Profile(),
        '/sign_in': (_) => Sign(),
        '/register': (_) => Reg1(),
        '/home': (_) => Sem(),
        '/layout': (_) => botombar(),
      },
    );
  }
}

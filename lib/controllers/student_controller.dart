import 'package:get/get.dart';
import 'package:the_platform/util/sherdpref.dart';

class StudentController extends GetxController {
  var user;
  @override
  void onInit() async {
    // TODO: implement onInit
    user = await getUserData();
    print(user);
    super.onInit();
  }

  getUserData() async {
    try {
      return await StorageUtil.getInstance().getData();
    } catch (e) {
      return null;
    }
  }
}

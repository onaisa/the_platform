import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static final StorageUtil _storageUtil = StorageUtil._internal();

  factory StorageUtil.getInstance() {
    return _storageUtil;
  }

  StorageUtil._internal();

  // void saveData(Object data) async {
  //   SharedPreferences _sharedPref = await SharedPreferences.getInstance();
  //       _sharedPref.setString('userData', jsonEncode(data));

  // }
  void saveData(Object data) async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.setString('userData', jsonEncode(data));
    _sharedPref.setString('initRoute', '/layout');
  }

  Future<String> getInitRoute() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref.getString('initRoute') ?? '/intro';
  }

  void removeData() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.remove('userData');
    _sharedPref.remove('initRoute');
  }

  Future<dynamic> getData() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    var s = jsonDecode(_sharedPref.get('userData'));
    print(s);
    return s;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/controllers/auth_controller.dart';
import 'package:the_platform/models/user_details_model.dart';
import 'dart:io';

import 'package:the_platform/ui/widgets/component.dart';

class Reg1 extends GetWidget<AuthController> {
  final User user = User();
  Rx<bool> passwordvisable = true.obs;
  var formregkey = GlobalKey<FormState>();

  File image;

  final imagepicker = ImagePicker();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController studentnumber = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  List<int> dropdownValue = [1, 2, 3, 4, 5];
  Object selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Register'),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formregkey,
            child: Column(
              children: <Widget>[
                ImageProfile(image),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        // child: Container(
                        //   height: 50.0,
                        child: StudentCheckBox(),
                        // ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Yearchoice(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namecontroller,
                    validator: (Value) {
                      if (Value.isEmpty)
                        return ' full Name is rquired';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      alignLabelWithHint: true,
                      labelText: "full Name",
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Full Name*",
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: studentnumber,
                    validator: (Value) {
                      if (Value.isEmpty)
                        return ' student number is rquired';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      alignLabelWithHint: true,
                      labelText: "Student number",
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Student number*",
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: phonecontroller,
                    validator: (Value) {
                      if (Value.isEmpty)
                        return ' Phone is rquired';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        alignLabelWithHint: true,
                        labelText: "Phone",
                        labelStyle: TextStyle(fontSize: 20),
                        hintText: "mobile phone*",
                        hintStyle: TextStyle(fontSize: 14),
                        prefixIcon: Icon(Icons.phone)),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (Value) {
                      if (Value.isEmpty)
                        return ' E-mail  is rquired';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      alignLabelWithHint: true,
                      labelText: "E-Mail",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "enter your email*",
                      hintStyle: TextStyle(fontSize: 16),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Obx(
                  () => Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return ' password is rquired';
                        else
                          return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          prefixIcon: Icon(Icons.lock),
                          alignLabelWithHint: true,
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "password*",
                          hintStyle: TextStyle(fontSize: 14),
                          suffixIcon: IconButton(
                            icon: Icon(passwordvisable.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              passwordvisable.value = !passwordvisable.value;
                            },
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: passwordvisable.value,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (Value) {
                      if (Value.isEmpty)
                        return ' Re-Enter Password is rquired';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Re-Enter your password",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Re-Enter Password*",
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                DefaultButton(
                  buttomname: 'Lets go',
                  on_pressed: () async {
                    if (user.photo == null) {
                      Get.snackbar("Image missing", "Please upload image");
                      return;
                    }
                    if (formregkey.currentState.validate()) {
                      print(emailcontroller.text);
                      print(passwordcontroller.text);
                      user.fullName = namecontroller.text;
                      user.phone = phonecontroller.text;
                      user.email = emailcontroller.text;
                      user.password = passwordcontroller.text;
                      user.passwordConfirmation = passwordcontroller.text;
                      var statusCode = await controller.register(user);
                      if (statusCode == 200) {
                        controller.isLoading(false);
                        Get.offNamed(signInRoute);
                      } else {
                        Get.snackbar("Error", "status code: $statusCode");
                      }
                    }
                  },
                ),
                Obx(
                  () {
                    if (controller.isLoading.value)
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(child: LinearProgressIndicator()),
                      );
                    else {
                      return Text('');
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ImageProfile(image) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 125,
          width: 125,
          child: image == null
              ? Image(
                  image: AssetImage('assets/images/profile_2.jpg'),
                  fit: BoxFit.cover,
                )
              : Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        // ),
        Positioned(
          // left: 90.0,
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 22.0,
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: Get.context,
                    builder: (ctxt) => Dialog(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Choose a Photo',
                                style: TextStyle(
                                    color: Color(0xff3489D4), fontSize: 24.0)),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    user.photo =
                                        (await uploadfromcamera()).toString();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                  ),
                                  iconSize: 50.0,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    user.photo =
                                        (await uploadfromgallery()).toString();
                                  },
                                  icon: Icon(Icons.image),
                                  iconSize: 50.0,
                                )
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'ok',
                                  style: TextStyle(fontSize: 20.0),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 30.0,
                )),
          ),
        )
      ],
    );
  }

  Widget StudentCheckBox() {
    var checked = false.obs;
    user.roleId = "0";
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: checked.value,
            onChanged: (value) {
              checked.value = !checked.value;
              if (!value) {
                user.roleId = "0";
              } else {
                user.roleId = "1";
              }
            },
          ),
        ),
        Text('student',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black54)),
      ],
    );
  }

  Widget Yearchoice() {
    Rx<int> selected = 1.obs;
    user.yearId = "1";
    return Container(
      child: Obx(
        () => DropdownButton(
          elevation: 3,
          hint: Text(
            'year',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
          items: dropdownValue
              .map(
                (e) => DropdownMenuItem(
                  onTap: () {},
                  value: e,
                  child: Center(
                    child: Text(
                      'year: ${e}',
                      style: TextStyle(fontSize: 22, color: Colors.indigo),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {
            selected.value = val;
            user.yearId = val.toString();
            print(user.yearId.toString());
          },
          value: selected.value,
        ),
      ),
    );
  }

  Future uploadfromcamera() async {
    var imagepicked = await ImagePicker().getImage(source: ImageSource.camera);
    if (imagepicked != null) {
      return File(imagepicked.path);
    } else {}
  }

  Future uploadfromgallery() async {
    var imagepicked = await ImagePicker().getImage(source: ImageSource.gallery);
    if (imagepicked != null) {
      return File(imagepicked.path);
    } else {}
  }
}

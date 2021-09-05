import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/controllers/auth_controller.dart';
import 'package:the_platform/models/user_details_model.dart';
import 'package:the_platform/models/user_model.dart';

class Sign extends GetWidget<AuthController> {
  final User user = User();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Rx<bool> passwordvisable = true.obs;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Sign in"),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value.isEmpty)
                        return ' email is rquired';
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff221f33)),
                          borderRadius: BorderRadius.circular(30.0)),
                      alignLabelWithHint: true,
                      labelText: "E-Mail",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "enter your email*",
                      hintStyle: TextStyle(fontSize: 14),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Obx(
                  () => Container(
                    margin: EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Color(0xff221f33),
                      validator: (value) {
                        if (value.isEmpty)
                          return ' password is rquired';
                        else
                          return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          focusColor: Colors.amber,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff221f33)),
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
                DefaultButton(
                  buttomname: 'Lets go',
                  on_pressed: () async {
                    if (formkey.currentState.validate()) {
                      print(emailcontroller.text);
                      print(passwordcontroller.text);
                      user.email = emailcontroller.text;
                      user.password = passwordcontroller.text;
                      await controller.login(user);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(registerRoute);
                      },
                      child: Text('Register Now',
                          style: TextStyle(color: Color(0xffd5b361))),
                    ),
                  ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget DefaultButton({
  Function on_pressed,
  String buttomname,
}) {
  return RaisedButton(
      onPressed: on_pressed,
      child: Text(
        buttomname,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Color(0xffd5b361),
      splashColor: Colors.white,
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)));
}

Widget DefaultAppBar({String title}) {
  return AppBar(
    backgroundColor: Colors.white30,
    elevation: 0.0,
    //  Color(0x11818080),
    title: Text(
      (title),
      style: TextStyle(color: Color(0xff221f33), fontSize: 30),
    ),
  );
}

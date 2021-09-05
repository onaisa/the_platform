import 'package:flutter/material.dart';

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
      color: Color(0x99d5b361),
      // color: Color(0xff221f33),
      splashColor: Colors.white,
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)));
}

Widget DefaultAppBar({String title}) {
  return AppBar(
    backgroundColor: Colors.white54,
    elevation: 0.0,
    // Color(0x11818080),
    title: Text(
      (title),
      style: TextStyle(color: Color(0xff221f33), fontSize: 30),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:the_platform/ui/Reg1.dart';
import 'package:the_platform/ui/pages/semesters.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sign_in.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void selectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      if (n == 1)
        return Reg1();
      else if (n == 2)
        return Sign();
      else
        return Sem();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x11d5b361),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xaa221f33),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 40, 40, 20),
                      child: Text(
                        ' CECO    Platform',
                        style: GoogleFonts.frederickaTheGreat(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 55,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/1st.png",
                    fit: BoxFit.fill,
                    height: 234.97,
                    width: 441.53,
                  ),
                ],
              ),
            ),
            Container(
              height: 400.0,
              color: Color(0x55d5b361).withOpacity(0.8),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "This platform is dedicated to Computer and Automation Engineering students in Damascus University.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      onPressed: () {
                        selectScreen(context, 1);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Color(0x99d5b361),
                      elevation: 4.0,
                      splashColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      onPressed: () {
                        selectScreen(context, 2);
                      },
                      child: Text(
                        'Sign in',
                        style:
                            TextStyle(color: Color(0xaa818080), fontSize: 20),
                      ),
                      color: Colors.white,
                      elevation: 4.0,
                      splashColor: Color(0xffd5b361),
                      padding: EdgeInsets.fromLTRB(38, 10, 38, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

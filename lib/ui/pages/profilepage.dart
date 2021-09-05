import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/constants.dart';
import 'package:the_platform/models/user_model.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:the_platform/util/sherdpref.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  StorageUtil storage = StorageUtil.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: DefaultAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: storage.getData(),
            // initialData: '',
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return CircularProgressIndicator();
              else
                return Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),

                    // for circle avtar image
                    _getHeader(),
                    SizedBox(
                      height: 10,
                    ),

                    _profileName(snapshot.data['user']['full_name']),

                    SizedBox(
                      height: 14,
                    ),
                    _heading("Personal Details"),
                    SizedBox(
                      height: 6,
                    ),

                    _detailsCard(),
                    SizedBox(
                      height: 10,
                    ),
                    _heading("Settings"),
                    SizedBox(
                      height: 6,
                    ),
                    _settingsCard(),
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    // logoutButton()
                  ],
                );
            },
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder(
          future: storage.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl: snapshot.data['user']['photo'],
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 18, color: Colors.indigo),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: storage.getData(),
        // initialData: '',
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return CircularProgressIndicator();
          else
            return Card(
              elevation: 4,
              child: Column(
                children: [
                  //row for each deatails
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(snapshot.data['user']['email']),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(snapshot.data['user']['phone']),
                  ),
                  Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(snapshot.data['user']['created_at']
                        .toString()
                        .substring(
                          0,
                          10,
                        )),
                  ),
                ],
              ),
            );
        },
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            InkWell(
              onTap: () {
                showAnimatedDialog(
                    context: context,
                    builder: (context) {
                      return ClassicGeneralDialogWidget(
                          titleText: 'About Us',
                          positiveTextStyle: TextStyle(color: Colors.indigo),
                          positiveText: 'ok',
                          contentText:
                              'This platform is dedicated to Computer and Automation Engineering students in Damascus University.',
                          onPositiveClick: () {
                            Navigator.of(context).pop();
                          });
                    });
              },
              child: ListTile(
                leading: Icon(Icons.dashboard_customize),
                title: Text("About Us"),
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            GestureDetector(
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text("Logout"),
              ),
              onTap: () {
                storage.removeData();
                Get.offAllNamed(signInRoute);
                print("logged out");
                // pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () {},
      child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}

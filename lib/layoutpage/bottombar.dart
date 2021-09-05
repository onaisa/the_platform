import 'package:flutter/material.dart';

import 'package:the_platform/ui/pages/notificationpage.dart';
import 'package:the_platform/ui/pages/profilepage.dart';
import 'package:the_platform/ui/pages/savedpage.dart';
import 'package:the_platform/ui/pages/semesters.dart';

class botombar extends StatefulWidget {
  Widget body;
  @override
  _botombarState createState() => _botombarState();
}

class _botombarState extends State<botombar> {
  int index = 0;
  List<Widget> screens = [Sem(), SavedPage(), NotificationPage(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0x99d5b361).withOpacity(0.9),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() {
            index = value;
            print(' index is $index');
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'Saved',
            icon: Icon(Icons.archive),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon: Icon(Icons.notification_important_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

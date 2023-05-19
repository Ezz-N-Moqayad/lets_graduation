import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lets_graduation/ui/activities/disability_screen.dart';
import 'package:lets_graduation/ui/group/groups_screen.dart';
import 'package:lets_graduation/ui/settings/settings_screen.dart';

import 'Heart_Beat.dart';
import 'home_screen.dart';
import 'profile.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late TabController _tabController;
  final _screen = [
    HomeScreen(),
    Profile(),
    GroupScreen(),
    HeartBeat(),
    SettingsScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: Color(0xFFF0F3F8),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          index: 0,
          height: 60,
          // index: _currentIndex,
          color: Colors.white,

          animationCurve: Curves.easeInBack,
          animationDuration: Duration(milliseconds: 600),
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Icon(Icons.home, size: 26, color: Color(0xff57CA85)),
            Icon(Icons.person, size: 26, color: Color(0xff57CA85)),
            Icon(Icons.groups, size: 26, color: Color(0xff57CA85)),
            Icon(Icons.heart_broken, size: 26, color: Color(0xff57CA85)),
            Icon(Icons.settings, size: 26, color: Color(0xff57CA85)),
          ],

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: _screen[_currentIndex],
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../group/contact/index.dart';
import '../../settings/settings_screen/index.dart';
import 'Heart_Beat.dart';
import 'home_screen.dart';
import 'profile.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final _screen = [
    const HomeScreen(),
    const Profile(),
    const ContactPage(),
    const HeartBeat(),
    const SettingsScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: const Color(0xFFF0F3F8),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          index: 0,
          height: 60,
          // index: _currentIndex,
          color: Colors.white,

          animationCurve: Curves.easeInBack,
          animationDuration: const Duration(milliseconds: 600),
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          items: const <Widget>[
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

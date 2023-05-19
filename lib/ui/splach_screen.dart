import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      // String rout = SharedPrefController().loggedin ? '/BootomNaviagtionScreen' : '/Language';
      // print("ROUTE: $rout");
      Get.offAndToNamed(AppRoutes.ScreenPageView);
// Navigator.pushReplacementNamed(context, '/Login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.topStart,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
              Color(0xff184E68),
              Color(0xff57CA85),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                'assets/images/lanuch.png',
                fit: BoxFit.contain,
                height: 170,
                width: 330,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

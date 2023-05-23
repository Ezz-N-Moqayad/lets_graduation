import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'index.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.handleSingIn();

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
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                'assets/images/lanuch.png',
                fit: BoxFit.contain,
                height: 170.h,
                width: 330.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

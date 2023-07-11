import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 106),
              child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Image.asset('assets/images/check_email.png')),
            ),
            SizedBox(
              height: 41.h,
            ),
            Text(
              'Check your email',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28, end: 16),
              child: Text(
                'We have sent password recovery instructions to \n your email.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 80, end: 13, start: 12),
              child: ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ), backgroundColor: Colors.white,
                  minimumSize: const Size(343, 48),
                ),
                child: Text(
                  'Open the email',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: const Color(0xff184E68),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

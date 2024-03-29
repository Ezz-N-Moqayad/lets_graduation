import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class SportActivitiesScreen extends StatelessWidget {
  const SportActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Activites',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              print('ff');
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff184E68),
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              '     Enter the number of family member:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                onTap: () {},
                onChanged: (String value) {},
                cursorColor: Colors.white,
                cursorRadius: const Radius.circular(10),
                enabled: true,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w,
                    color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: const Color(0xffD9D9D9),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 342.w,
                      maxHeight: 50.h,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Text(
              '        Enter the number of girls member:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                onTap: () {},
                onChanged: (String value) {},
                cursorColor: Colors.white,
                cursorRadius: const Radius.circular(10),
                enabled: true,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w,
                    color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: const Color(0xffD9D9D9),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 342.w,
                      maxHeight: 50.h,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Text(
              '     Enter the number of boys member:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                onTap: () {},
                onChanged: (String value) {},
                cursorColor: Colors.white,
                cursorRadius: const Radius.circular(10),
                enabled: true,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w,
                    color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: const Color(0xffD9D9D9),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 342.w,
                      maxHeight: 50.h,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton(
                onPressed: () async {
                  Get.offAndToNamed(AppRoutes.disability);
                },
                child: Text(
                  'Send Informion',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: const Color(0xff184E68),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ), backgroundColor: const Color(0xff57CA85),
                  minimumSize: Size(343.w, 48.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

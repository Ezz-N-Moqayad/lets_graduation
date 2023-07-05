import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';

class DisabilityScreen extends StatelessWidget {
  const DisabilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
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
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff184E68),
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              '     Enter the type of disability:',
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
                cursorRadius: Radius.circular(10),
                enabled: true,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w,
                    color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xffD9D9D9),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    helperMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 342.w,
                      maxHeight: 50.h,
                    ),
                    suffixIcon: Icon(
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
                  Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
                },
                child: Text(
                  'keep going ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff184E68),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ), backgroundColor: Color(0xff57CA85),
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

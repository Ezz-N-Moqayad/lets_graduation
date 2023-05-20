import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/register_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.topStart,
        decoration: BoxDecoration(
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
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10, top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Forgot your password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 85,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 17),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Password Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 0, end: 12),
              child: Text(
                'Enter the email associated with your account and\nwe will send an email with instructions to reset your\npassword.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.5),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 17),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                obscuringCharacter: '*',
                onTap: () => controller.ForgetPasswordController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                cursorRadius: Radius.circular(10),
                enabled: true,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w,
                    color: Colors.white),
                decoration: InputDecoration(
                  hintText: '   write old password here',
                  hintStyle: TextStyle(
                    color: Color(0xffD9D9D9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  helperMaxLines: 1,
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF5F5F5), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF5F5F5), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 80, end: 13, start: 12),
              child: ElevatedButton(
                onPressed: () async {},
                child: Text(
                  'Send Informion',
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
                  ),
                  minimumSize: Size(343, 48),
                  primary: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

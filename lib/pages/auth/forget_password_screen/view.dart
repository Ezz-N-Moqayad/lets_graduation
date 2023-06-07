import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/routes/routes.dart';
import 'index.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordController controller = Get.put(ForgetPasswordController());

  ForgetPasswordScreen({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff184E68),
              Color(0xff57CA85),
            ],
            transform: GradientRotation(45),
          ),
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: InkWell(
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Get.offAndToNamed(AppRoutes.login),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 25),
                    const Text(
                      'Forgot your password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 17, top: 75),
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
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 0, end: 12),
              child: Text(
                'Enter the email associated with your account and\nwe will send an email with instructions to reset your\npassword.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.5),
              ),
            ),
            const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 17),
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                obscuringCharacter: '*',
                onTap: () => controller.ForgetPassController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                cursorRadius: const Radius.circular(10),
                enabled: true,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w,
                    color: Colors.white),
                decoration: InputDecoration(
                  hintText: '   write old password here',
                  hintStyle: const TextStyle(
                    color: Color(0xffD9D9D9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  helperMaxLines: 1,
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffF5F5F5), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffF5F5F5), width: 1),
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
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  minimumSize: const Size(343, 48),
                  primary: Colors.white,
                ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

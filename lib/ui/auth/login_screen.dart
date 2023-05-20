import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lets_graduation/controller/login_controller.dart';
import 'package:lets_graduation/utils/app_color.dart';
import 'package:lets_graduation/utils/app_helper.dart';

import '../../common/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

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
          ])),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.h,
              ),
              Text(
                'Let’s start here ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 34.sp,
                  letterSpacing: -0.41,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5),
                child: Text(
                  'Fill in your details to begin',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    letterSpacing: -0.41,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 53,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 135),
                child: Text(
                  'User name',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  onChanged: (String value) {},
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(10),
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.w,
                      color: Colors.white),
                  decoration: InputDecoration(
                    helperMaxLines: 1,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF5F5F5), width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF5F5F5), width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onTap: () => controller.nameController,
                  validator: (name) => AppHelper.validateName(name: name!),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 135),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  obscuringCharacter: '*',
                  onChanged: (String value) {},
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(10),
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.w,
                      color: Colors.white),
                  decoration: InputDecoration(
                    helperMaxLines: 1,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF5F5F5), width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF5F5F5), width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    suffixIcon: InkWell(
                      child: Icon(controller.visiblePassIcon,
                          color: AppColors.baccolor),
                      onTap: () => controller.visiblePassword(),
                    ),
                  ),
                  onTap: () => controller.visiblePassword(),
                  validator: (password) =>
                      AppHelper.validatePassword(password: password!),
                ),
              ),
              SizedBox(
                height: 55.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 13, start: 12),
                child: ElevatedButton(
                  onPressed: () async {
                    Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff184E68),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
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
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot your password',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(AppRoutes.ForgetPassword);
                    },
                    child: Text(
                      ' Click here',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Color(0xff184E68),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 120.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(AppRoutes.register);
                    },
                    child: Text(
                      ' Click here',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: Color(0xff184E68),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       height: 1.h,
              //       width: 160.w,
              //       alignment: AlignmentDirectional.topStart,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //       ),
              //     ),
              //     Text(
              //       'OR',
              //       style: TextStyle(
              //           fontFamily: 'Roboto',
              //           fontWeight: FontWeight.w400,
              //           fontSize: 18.sp,
              //           color: Colors.white),
              //       textAlign: TextAlign.center,
              //     ),
              //     Container(
              //       height: 1.sp,
              //       width: 160.w,
              //       alignment: AlignmentDirectional.topStart,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 23.sp,
              ),
              // Align(
              //   alignment: AlignmentDirectional.center,
              //   child: InkWell(
              //     onTap: (){
              //       Navigator.pushReplacementNamed(context, '/Singin');
              //     },
              //     child: Text(
              //       'SignUp with social account',
              //       style: TextStyle(
              //         fontFamily: 'Roboto',
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14.sp,
              //         color: Color(0xff184E68),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 64.sp,
              //       width: 92.w,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(24),
              //       ),
              //       child: Image.asset('assets/images/gmail.png'),
              //     ),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Container(
              //       height: 64.h,
              //       width: 92.w,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(24),
              //       ),
              //       child: Image.asset(
              //         'assets/images/facebook.png',
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}

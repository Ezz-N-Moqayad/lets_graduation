import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import 'index.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

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
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 85.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 5, top: 3),
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 53, end: 135),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 12, end: 16),
                    child: TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.state.emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      cursorColor: Colors.white,
                      cursorRadius: const Radius.circular(10),
                      enabled: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.w,
                          color: Colors.white),
                      decoration: InputDecoration(
                        helperMaxLines: 1,
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF5F5F5), width: 1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF5F5F5), width: 1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onTap: () => controller.state.emailController,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 12, end: 135),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16, top: 12),
                    child: Obx(
                      () => TextField(
                        controller: controller.state.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: controller.state.isPasswordHidden.value,
                        obscuringCharacter: '*',
                        onTap: () {},
                        onChanged: (String value) {},
                        cursorColor: Colors.white,
                        cursorRadius: const Radius.circular(10),
                        enabled: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white),
                        decoration: InputDecoration(
                          helperMaxLines: 1,
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffF5F5F5), width: 1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffF5F5F5), width: 1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          suffix: InkWell(
                            child: Icon(
                              controller.state.isPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onTap: () {
                              controller.state.isPasswordHidden.value =
                                  !controller.state.isPasswordHidden.value;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 58, end: 13, start: 12),
                    child: ElevatedButton(
                      onPressed: () async => await controller.performLogin(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.white,
                        minimumSize: const Size(343, 48),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: const Color(0xff184E68),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 12),
                    child: Row(
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
                              color: const Color(0xff184E68),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1.h,
                          width: 160.w,
                          alignment: AlignmentDirectional.topStart,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 1.sp,
                          width: 160.w,
                          alignment: AlignmentDirectional.topStart,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 13),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'SignUp with social account',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0xff184E68),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 81, top: 20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => controller.handleSignIn(),
                          child: Container(
                            height: 64,
                            width: 92,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset('assets/images/gmail.png'),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 16),
                            child: Container(
                              height: 64.h,
                              width: 92.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Image.asset('assets/images/facebook.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 35.0, bottom: 15.0),
                    child: Row(
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
                              color: const Color(0xff184E68),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

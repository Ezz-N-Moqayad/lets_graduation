import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../common/routes/routes.dart';
import 'index.dart';

// ignore: must_be_immutable
class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            padding:
                const EdgeInsetsDirectional.only(start: 16, top: 85, end: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Let’s start here ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                      letterSpacing: -0.41,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 5),
                    child: Text(
                      'Fill in your details to begin',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: -0.41,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _showPicker(context),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 25.h),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: const Color(0xff2d4d2d),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Obx(
                                () => controller
                                        .state.imagePath.value.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(55),
                                        child: Image.file(
                                          File(
                                            controller.state.imagePath.value,
                                          ),
                                          fit: BoxFit.cover,
                                          width: 100.w,
                                          height: 100.h,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(55),
                                        child: Image.asset(
                                          'assets/images/personal_group.png',
                                          fit: BoxFit.contain,
                                          width: 100.w,
                                          height: 100.h,
                                        ),
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 75, start: 70),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF5F5FA),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xffF5F5FA),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color(0xff57CA85),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 40),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 12),
                    child: TextFormField(
                      controller: controller.state.NameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
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
                      ),
                      onTap: () => controller.state.NameController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 18),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 12),
                    child: TextFormField(
                      controller: controller.state.EmailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                      ),
                      onTap: () => controller.state.EmailController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 18),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 12),
                    child: Obx(
                      () => TextField(
                        controller: controller.state.PasswordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
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
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 18),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 12),
                    child: Obx(
                      () => TextField(
                        controller: controller.state.ConfirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText:
                            controller.state.isConfirmPasswordHidden.value,
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
                              controller.state.isConfirmPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onTap: () {
                              controller.state.isConfirmPasswordHidden.value =
                                  !controller
                                      .state.isConfirmPasswordHidden.value;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 30, start: 12),
                    child: ElevatedButton(
                      onPressed: () async => await controller.performRegister(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.white,
                        minimumSize: const Size(343, 48),
                      ),
                      child: const Text(
                        'Sigin',
                        style: TextStyle(
                          color: Color(0xff184E68),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: 160,
                          alignment: AlignmentDirectional.topStart,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 1,
                          width: 160,
                          alignment: AlignmentDirectional.topStart,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 16),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'SignUp with social account',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xff184E68),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        const SizedBox(width: 20),
                        Container(
                          height: 64,
                          width: 92,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset('assets/images/facebook.png'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 25.0, bottom: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do have an account?',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAndToNamed(AppRoutes.login);
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

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () async {
                  try {
                    final image = await controller.imgFromGallery();
                    controller.state.imagePath.value = image!.path;
                  } catch (e) {
                    print('Error picking image: $e');
                    // Handle the error if necessary
                  }

                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Camera"),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

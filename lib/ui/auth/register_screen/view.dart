import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import '../../../utils/app_helper.dart';
import 'index.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

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
              ]),
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
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 40),
                  child: Text(
                    'User name',
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
                    controller: controller.NameController,
                    keyboardType: TextInputType.name,
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
                    onTap: () => controller.NameController,
                    validator: (name) => AppHelper.validateName(name: name!),
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
                    controller: controller.EmailController,
                    keyboardType: TextInputType.emailAddress,
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
                    onTap: () => controller.EmailController,
                    validator: (email) =>
                        AppHelper.validateEmail(email: email!),
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
                      controller: controller.PasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: controller.isPasswordHidden.value,
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
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onTap: () {
                            controller.isPasswordHidden.value =
                                !controller.isPasswordHidden.value;
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
                      controller: controller.ConfirmPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: controller.isConfirmPasswordHidden.value,
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
                            controller.isConfirmPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onTap: () {
                            controller.isConfirmPasswordHidden.value =
                                !controller.isConfirmPasswordHidden.value;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20, start: 12),
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.offAndToNamed(AppRoutes.done);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      minimumSize: const Size(343, 48),
                      primary: Colors.white,
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
                const SizedBox(height: 10),
                Row(
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
                const SizedBox(height: 10),
                Align(
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
                const SizedBox(height: 10),
                Row(
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
                      child: Image.asset(
                        'assets/images/facebook.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    ), ),
    );
  }
}

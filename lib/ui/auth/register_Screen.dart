import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/register_controller.dart';
import '../../utils/app_helper.dart';
import '../../common/routes/routes.dart';

class RegisterScreen extends StatelessWidget {
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
                  height: 150,
                ),
                Text(
                  'Let’s start here ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    letterSpacing: -0.41,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
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
                SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'User name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: TextFormField(
                    controller: controller.NameController,
                    keyboardType: TextInputType.name,
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(10),
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
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
                    onTap: () => controller.NameController,
                    validator: (name) => AppHelper.validateName(name: name!),
                  ),
                ),

                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: TextFormField(
                    controller: controller.EmailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(10),
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
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
                    onTap: () => controller.EmailController,
                    validator: (email) =>
                        AppHelper.validateEmail(email: email!),
                  ),
                ),

                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: TextField(
                    controller: controller.PasswordController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    onTap: () {},
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(10),
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
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
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),

                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Password Agin',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: TextField(
                    controller: controller.PasswordController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    onTap: () {},
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(10),
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
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
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),

                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: TextField(
                    controller: controller.ConfirmPasswordController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    onTap: () {},
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: Radius.circular(10),
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
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
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 13, start: 12),
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.offAndToNamed(AppRoutes.done);
                    },
                    child: Text(
                      'Sigin',
                      style: TextStyle(
                        color: Color(0xff184E68),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
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
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 1,
                //       width: 160,
                //       alignment: AlignmentDirectional.topStart,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //       ),
                //     ),
                //     Text(
                //       'OR',
                //       style: TextStyle(
                //           fontWeight: FontWeight.w400,
                //           fontSize: 18,
                //           color: Colors.white),
                //       textAlign: TextAlign.center,
                //     ),
                //     Container(
                //       height: 1,
                //       width: 160,
                //       alignment: AlignmentDirectional.topStart,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                // Align(
                //   alignment: AlignmentDirectional.center,
                //   child: InkWell(
                //     onTap: ()async{
                //       // _performLogin();
                //       Navigator.pushReplacementNamed(context, '/Login');
                //     },
                //     child: Text(
                //       'SignUp with social account',
                //       style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //         fontSize: 14,
                //         color: Color(0xff184E68),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 64,
                //       width: 92,
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
                //       height: 64,
                //       width: 92,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/register_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Change Password',
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
                height: 94,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 25),
                child: Text(
                  'Old Password: ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                child: TextField(
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
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 25),
                child: Text(
                  'New Password: ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                child: TextField(
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
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 25),
                child: Text(
                  'Confirm Password: ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: TextFormField(
                  controller: controller.OldPasswordController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  obscuringCharacter: '*',
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
                  onTap: () => controller.OldPasswordController,
                  // validator: (name) =>
                  //     AppHelper.validateName(name: name!),
                ),
              ),

              SizedBox(
                height: 84.h,
              ),
              // Padding(
              //   padding:
              //   const EdgeInsetsDirectional.only(top: 0, end: 16, start: 24),
              //   child: ElevatedButton(
              //     onPressed: () async {},
              //     child: Text(
              //       'Open the email',
              //       style: TextStyle(
              //         fontFamily: 'Roboto',
              //         color: Color(0xff184E68),
              //         fontWeight: FontWeight.w500,
              //         fontSize: 18.sp,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(14),
              //       ),
              //       minimumSize: Size(343, 48),
              //       primary: Colors.white,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: TextFormField(
                  controller: controller.NewPasswordController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  obscuringCharacter: '*',
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
                  onTap: () => controller.NewPasswordController,
                  // validator: (name) =>
                  //     AppHelper.validateName(name: name!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

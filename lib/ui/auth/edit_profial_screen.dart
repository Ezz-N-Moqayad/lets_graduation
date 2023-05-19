import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lets_graduation/controller/register_controller.dart';

class EditProfialScreen extends StatelessWidget {
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
                    width: 80,
                  ),
                  Text(
                    'Edit Profile',
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
              height: 43,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 91,
                    height: 91,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5FA),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('gg');
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xffF5F5FA),
                        child: Image.asset(
                          'assets/images/personal_group.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 75, start: 70),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('gg');
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xffF5F5FA),
                          child: Icon(
                            Icons.camera_alt,
                            color: Color(0xff57CA85),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 25),
              child: Text(
                'Name',
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
                // controller: controller.EmailController,
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
                    borderSide: BorderSide(color: Color(0xffF5F5F5), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF5F5F5), width: 1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                // onTap: () => controller.EmailController,
                // validator: (email) =>
                //     AppHelper.validateEmail(email: email!),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 25),
              child: Text(
                'Name',
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
                keyboardType: TextInputType.emailAddress,
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
                  hintText: 'h.luv.a01@gmail.com',
                  hintStyle: TextStyle(
                    color: Colors.white,
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
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 0, end: 16, start: 24),
              child: ElevatedButton(
                onPressed: () async {},
                child: Text(
                  'Save',
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/app_helper.dart';
import '../../../controller/register_controller.dart';
import '../../../common/routes/routes.dart';

class DoneScreen extends StatelessWidget {
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
                  height: 85,
                ),
                Text(
                  'We love walk!!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    letterSpacing: -0.41,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Tell us something about ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: -0.41,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/Singin');
                      },
                      child: Text(
                        'You',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: -0.41,
                          color: Color(0xff57CA85),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Divider(
                    color: Colors.white,
                    thickness: 4,
                    endIndent: 12,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Steps',
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
                    controller: controller.StepsController,
                    keyboardType: TextInputType.number,
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
                    onTap: () => controller.StepsController,
                    validator: (name) => AppHelper.validateName(name: name),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Walking time',
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
                    controller: controller.HeightkController,
                    keyboardType: TextInputType.number,
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
                    onTap: () => controller.StepsController,
                    validator: (name) => AppHelper.validateName(name: name),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Height  (Kg)',
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
                    controller: controller.HeightCmController,
                    keyboardType: TextInputType.number,
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
                    onTap: () => controller.StepsController,
                    validator: (name) => AppHelper.validateName(name: name),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Height  (Cm)',
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
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 135),
                  child: Text(
                    'Location',
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
                    controller: controller.LocationController,
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
                    onTap: () => controller.StepsController,
                    validator: (name) => AppHelper.validateName(name: name),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 13, start: 12),
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.offAndToNamed(AppRoutes.Activities);
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Roboto',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

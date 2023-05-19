import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
                    'Settings',
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
              height: 54,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: InkWell(
                onTap: () {
                  Get.offAndToNamed(AppRoutes.editProfial);
                },
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.photo_camera_front_rounded,
                        color: Color(0xff57CA85),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Edit Account",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              color: Color(0xffF0F0F0),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.circle_notifications_rounded,
                        color: Color(0xff57CA85),
                      )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 22),
            //   child: Row(
            //     children: [
            //       Container(
            //           width: 40.w,
            //           height: 40.h,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.rectangle,
            //               color: Colors.white,
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.withOpacity(0.5),
            //                   blurRadius: 7,
            //                   offset: Offset(0, 3), // changes position of shadow
            //                 ),
            //               ],
            //               borderRadius: BorderRadius.circular(10)
            //           ),
            //           child:Icon(Icons.sd_storage,color: Color(0xff57CA85),)
            //       )
            //       ,
            //       SizedBox(
            //         width: 20.w,
            //       ),
            //
            //       Text("Storage & Data",style: TextStyle(
            //           fontSize: 18.sp,fontWeight: FontWeight.w400,
            //           color: Colors.white
            //       ),),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              color: Color(0xffF0F0F0),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.language,
                        color: Color(0xff57CA85),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              color: Color(0xffF0F0F0),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: InkWell(
                onTap: () {
                  Get.offAndToNamed(AppRoutes.About);
                },
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.local_phone_rounded,
                        color: Color(0xff57CA85),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              color: Color(0xffF0F0F0),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.logout_outlined,
                      color: Color(0xff57CA85),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Divider(
              color: Color(0xffF0F0F0),
            ),
          ],
        ),
      ),
    );
  }
}

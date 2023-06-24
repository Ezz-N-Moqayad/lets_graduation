import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget GroupPage({required String nameGroup, required String imageGroup}) {
  return Container(
    padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
    alignment: AlignmentDirectional.topStart,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameGroup,
          style: TextStyle(
            color: const Color(0xff57CA85),
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(
              start: 22, end: 22, top: 20, bottom: 25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          height: 200.h,
          child: Image.asset(
            imageGroup,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ],
    ),
  );
}

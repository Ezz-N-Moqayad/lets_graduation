import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget FoodCard({
  required String nameCard,
  required String imageCard,
  required String titleCard,
}) {
  return SizedBox(
    width: 115.w,
    height: 225.h,
    child: Stack(
      children: [
        Container(
          width: 115.w,
          height: 225.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 115.w,
              height: 89.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image.asset(
                  imageCard,
                  width: 115.w,
                  height: 89.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.h),
              child: Text(
                nameCard,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'Markazi Text',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.h),
              child: SizedBox(
                width: 110.w,
                height: 100.h,
                child: Text(
                  titleCard,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Barlow Condensed',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

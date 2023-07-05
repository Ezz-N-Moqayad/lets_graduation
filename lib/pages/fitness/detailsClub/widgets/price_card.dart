import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Widget PriceCard({
  required String nameCard,
  required String imageCard,
  required String titleCard,
  required String priceCard,
  required Color colorCard,
}) {
  return SizedBox(
    width: 115.w,
    height: 240.h,
    child: Stack(
      children: [
        Container(
          width: 115.w,
          height: 240.h,
          decoration: ShapeDecoration(
            color: colorCard,
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
              height: 82.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Image.asset(
                  imageCard,
                  width: 115.w,
                  height: 82.h,
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
            Padding(
              padding: EdgeInsetsDirectional.only(end: 7.h),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  '$priceCard\$',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Barlow Condensed',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

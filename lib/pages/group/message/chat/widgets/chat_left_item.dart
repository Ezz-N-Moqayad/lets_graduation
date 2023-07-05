import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../common/models/msgcontent.dart';
import '../../../../../common/routes/names.dart';
import '../../../../../common/values/colors.dart';

Widget ChatLeftItem(Msgcontent item) {
  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 15.w, right: 15.w, bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 230.w, minHeight: 40.w),
          child: Container(
            margin: EdgeInsets.only(right: 10.w, top: 0.w),
            padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 200, 200, 200),
                  Color.fromARGB(255, 200, 200, 200),
                ],
                transform: GradientRotation(135),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: item.type == "text"
                ? Text(
                    "${item.content}",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 12.sp,
                    ),
                  )
                : Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 10.h),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 360.h),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.Photoimgview,
                            parameters: {"url": item.content ?? ""},
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: "${item.content}",
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    ),
  );
}

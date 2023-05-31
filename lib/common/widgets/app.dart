import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/values.dart';

///  AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff184E68),
            Color(0xff57CA85),
          ],
          transform: GradientRotation(45),
        ),
      ),
    ),
    title: title != null
        ? Padding(
            padding: EdgeInsetsDirectional.only(end: 60.w),
            child: Center(child: title),
          )
        : null,
    leading: leading,
    actions: actions,
  );
}

/// 10像素 Divider
Widget divider10Px({Color bgColor = AppColors.secondaryElement}) {
  return Container(
    height: 100.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}

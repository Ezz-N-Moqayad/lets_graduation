import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/values.dart';
import '../../../common/widgets/widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "About",
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    // ignore: no_leading_underscores_for_local_identifiers
    Widget _buildBody() {
      return Container(
        alignment: AlignmentDirectional.topStart,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.centerEnd,
            colors: [
              Color(0xff184E68),
              Color(0xff57CA85),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 40.h),
              child: const Text(
                'About the app ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 30),
              child: Text(
                'Our vission',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 30),
              child: Text(
                'Our mission',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 30),
              child: Text(
                'Our services',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 22, top: 10),
              child: Text(
                'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\n duis enim velit mollit. Exercitation veniam\n consequat sunt nostrud amet.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

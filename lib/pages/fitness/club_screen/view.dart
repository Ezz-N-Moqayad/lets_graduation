import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/values/values.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

// ignore: must_be_immutable
class ClubScreen extends GetView<ClubController> {
  ClubScreen({Key? key}) : super(key: key);

  ClubController controllers = Get.put(ClubController());

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Club",
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 22, end: 22, top: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    height: 200.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/image_gmet.jpeg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Khalil ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: 20,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

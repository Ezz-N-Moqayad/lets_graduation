import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/values/values.dart';
import '../../../../common/widgets/widgets.dart';
import 'index.dart';
import 'widgets/price_card.dart';

// ignore: must_be_immutable
class DetailsClub extends GetView<DetailsClubController> {
  DetailsClub({Key? key}) : super(key: key);

  @override
  DetailsClubController controller = Get.put(DetailsClubController());

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Club Details",
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
        children: [
          SizedBox(
            width: double.infinity.w,
            height: 200.h,
            child: Image.asset(
              'assets/images/gem1.jpg',
              width: double.infinity.w,
              height: double.infinity.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 7.w, end: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 15),
                  child: Text(
                    'GEM SHAHEEN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 24.h),
                        child: Container(
                          width: double.infinity.w,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'gaza,palestine,24 street',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7300000190734863),
                          fontSize: 15,
                          fontFamily: 'Markazi Text',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 6.h),
                        child: SizedBox(
                          width: 300.w,
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
                            style: TextStyle(
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 22.h, start: 9.w),
                  child: const Text(
                    'Price Card',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Markazi Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 15.h, bottom: 15.h),
                  child: SizedBox(
                    width: double.infinity.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PriceCard(
                          nameCard: 'Bronze',
                          imageCard: 'assets/images/gem2.jpg',
                          titleCard:
                              'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.',
                          priceCard: '20',
                          colorCard: const Color(0xFFD9D9D9),
                        ),
                        SizedBox(width: 7.w),
                        PriceCard(
                          nameCard: 'Silver',
                          imageCard: 'assets/images/gem3.jpg',
                          titleCard:
                              'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.',
                          priceCard: '30',
                          colorCard: const Color(0xFFC0C0C0),
                        ),
                        SizedBox(width: 7.w),
                        PriceCard(
                          nameCard: 'Golden',
                          imageCard: 'assets/images/gem4.jpg',
                          titleCard:
                              'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.',
                          priceCard: '50',
                          colorCard: const Color(0xFFFFD700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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

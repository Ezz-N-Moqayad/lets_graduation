import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/models/models.dart';
import '../../../common/values/values.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

// ignore: must_be_immutable
class ClubScreen extends GetView<ClubController> {
  ClubScreen({Key? key}) : super(key: key);

  @override
  ClubController controller = Get.put(ClubController());

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
      return FutureBuilder<List<Gym>?>(
        future: controller.state.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            controller.state.gym = snapshot.data!;

            return ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.toNamed("/DetailsClub"),
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 16.w, end: 20.w, top: 20.h, bottom: 20.h),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 64.w,
                          height: 64.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              'assets/images/image_gmet.jpeg',
                              fit: BoxFit.fill,
                              width: 64.w,
                              height: 64.w,
                            ),
                            // Image.network(
                            //   controller.state.gym[index].image,
                            //   fit: BoxFit.cover, // Adjust the image's fit within the widget
                            // ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                controller.state.gym[index].name,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.thirdElement,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Text(
                                controller.state.gym[index].location,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.thirdElement,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
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
              itemCount: controller.state.gym.length,
            );
          } else {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.grey,
                    size: 50,
                  ),
                  Text(
                    'No DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

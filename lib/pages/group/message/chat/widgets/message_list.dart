import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../common/utils/utils.dart';
import '../../../../../common/models/models.dart';
import '../../../../../common/values/values.dart';
import '../../index.dart';

class MessageList extends GetView<MessageController> {
  const MessageList({super.key});

  Widget messageListItem(QueryDocumentSnapshot<Msg> item) {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: InkWell(
            onTap: () {
              var toUid = "";
              var toName = "";
              var toAvatar = "";
              if (item.data().from_uid == controller.token) {
                toUid = item.data().to_uid ?? "";
                toName = item.data().to_name ?? "";
                toAvatar = item.data().to_avatar ?? "";
              } else {
                toUid = item.data().from_uid ?? "";
                toName = item.data().from_name ?? "";
                toAvatar = item.data().from_avatar ?? "";
              }

              Get.toNamed(
                "/chat",
                parameters: {
                  "doc_id": item.id,
                  "to_uid": toUid,
                  "to_name": toName,
                  "to_avatar": toAvatar,
                },
              );
            },
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 20.h, bottom: 20.h),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(end: 15.w),
                    child: SizedBox(
                      width: 58.w,
                      height: 58.w,
                      child: CachedNetworkImage(
                        imageUrl: item.data().from_uid == controller.token
                            ? item.data().to_avatar!
                            : item.data().from_avatar!,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 58.w,
                          height: 58.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(58)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage('assets/images/personal_group.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180.w,
                          height: 55.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.data().from_uid == controller.token
                                    ? item.data().to_name!
                                    : item.data().from_name!,
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
                                item.data().last_msg ?? "",
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.thirdElement,
                                  fontSize: 17.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          height: 54.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                duTimeLineFormat(
                                  (item.data().last_time as Timestamp).toDate(),
                                ),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.thirdElementText,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget listItemIsEmpty() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: 175.h),
          child: SizedBox(
            width: 342.w,
            height: 281.h,
            child: Image.asset('assets/images/no_chat_yet.png'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 35.h, bottom: 15.h),
          child: GradientText(
            "No Chat Yet",
            textAlign: TextAlign.center,
            colors: const [
              Color(0xff184E68),
              Color(0xff57CA85),
            ],
            gradientDirection: GradientDirection.ttb,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onLoading: controller.onLoading,
        onRefresh: controller.onRefresh,
        header: const WaterDropHeader(),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = controller.state.msgList[index];
                    if (controller.state.msgList.isNotEmpty) {
                      return messageListItem(item);
                    } else {
                      return listItemIsEmpty();
                    }
                  },
                  childCount: controller.state.msgList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

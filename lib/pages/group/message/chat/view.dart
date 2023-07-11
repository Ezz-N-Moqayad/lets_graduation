import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/values/values.dart';
import 'index.dart';
import 'widgets/chat_list.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
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
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: InkWell(
                child: SizedBox(
                  width: 44.w,
                  height: 44.w,
                  child: CachedNetworkImage(
                    imageUrl: controller.state.to_avatar.value,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 44.w,
                      width: 44.w,
                      margin: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(44.w)),
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
            ),
            SizedBox(width: 15.w),
            Container(
              width: 180.w,
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 44.w,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.state.to_name.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground,
                              fontSize: 16.sp,
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.state.to_location.value,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryBackground,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  controller.imgFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Camera"),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: [
              const ChatList(),
              Positioned(
                bottom: 0.h,
                height: 55.h,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 0.w, bottom: 0.h, end: 0.w),
                  child: Container(
                    width: double.infinity.w,
                    height: 55.h,
                    color: AppColors.primaryBackground,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: SizedBox(
                            width: 43.w,
                            height: 43.h,
                            child: GestureDetector(
                              child: Icon(
                                Icons.photo_outlined,
                                size: 43.w,
                                color: const Color(0xFF184E68),
                                // color: const Color(0xFF57CA85),
                              ),
                              onTap: () => _showPicker(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 15.w, bottom: 5.h, top: 5.h, end: 15.w),
                          child: Container(
                            width: 280.w,
                            height: 100.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF4F400),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(start: 16.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 200.w,
                                    child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      controller: controller.textController,
                                      autofocus: false,
                                      focusNode: controller.contentNode,
                                      decoration: const InputDecoration(
                                        hintText: "Aa...",
                                        hintStyle: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                    EdgeInsetsDirectional.only(start: 5.w),
                                    width: 30.w,
                                    height: 30.h,
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.send,
                                        size: 30.w,
                                        // color: Color(0xFF184E68),
                                        color: const Color(0xFF57CA85),
                                      ),
                                      onTap: () => controller.sendMessage(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'chat/widgets/message_list.dart';
import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 75,
      title: GradientText(
        'Chats',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20.sp,
        ),
        gradientType: GradientType.linear,
        gradientDirection: GradientDirection.ttb,
        colors: const [
          Color(0xff184E68),
          Color(0xff57CA85),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const MessageList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/ContactPage"),
        backgroundColor: const Color(0xff57CA85),
        child: const Icon(Icons.chat),
      ),
    );
  }
}

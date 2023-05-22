import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/app.dart';
import 'chat/widgets/message_list.dart';
import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return transparentAppBar(
      title: Text(
        "Message",
        style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: MessageList(),
    );
  }
}

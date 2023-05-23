import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import '../../../common/widgets/app.dart';
import 'index.dart';
import 'widgets/contactList.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar _buildAppBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 104, 132, 231),
                Color.fromARGB(255, 131, 123, 231),
                Color.fromARGB(255, 166, 112, 231),
                Color.fromARGB(255, 176, 106, 231),
              ],
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
          child: const Row(),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }
}

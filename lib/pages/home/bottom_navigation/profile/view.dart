import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

// ignore: must_be_immutable
class Profile extends GetView<ProfileController> {
  Profile({Key? key}) : super(key: key);

  @override
  ProfileController controller = Get.put(ProfileController());

  // SingleChildScrollView(
  // scrollDirection: Axis.vertical,

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Widget _buildBody() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 11, bottom: 52.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.toNamed("/EditProfileScreen"),
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.toNamed("/SettingsScreen"),
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('gg');
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xffF5F5FA),
                          child: Icon(
                            Icons.chat,
                            color: Color(0xff57CA85),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5FA),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: SizedBox(
                            width: 85.w,
                            height: 85.w,
                            child: CachedNetworkImage(
                              imageUrl: controller.state.photoUrl.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 85.w,
                                width: 85.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(44.w),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => const Image(
                                image: AssetImage(
                                    'assets/images/personal_group.png'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          controller.state.name.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          controller.state.email.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('gg');
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xffF5F5FA),
                          child: Icon(
                            Icons.group,
                            color: Color(0xff57CA85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 25),
                  child: Text(
                    'Goals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 343,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffF5F5FA),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                const Text(
                                  '10,000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.sports_gymnastics_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Steps',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle_outline_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 343,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffF5F5FA),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                const Text(
                                  '200',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.sports_gymnastics_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Kcal',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 343,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffF5F5FA),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                const Text(
                                  '3.0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.sports_gymnastics_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Km',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 343,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffF5F5FA),
                      ),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                const Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.sports_gymnastics_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Min',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 343,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffF5F5FA),
                      ),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                const Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.sports_gymnastics_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Text(
                                      'Min',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.do_disturb_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: _buildBody(),
    );
  }
}

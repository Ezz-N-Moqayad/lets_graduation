import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: AlignmentDirectional.topStart,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [
                Color(0xff184E68),
                Color(0xff57CA85),
              ])),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.editProfial);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          )),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 52,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('gg');
                        },
                        child: CircleAvatar(
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
                            color: Color(0xffF5F5FA),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: () {
                              print('gg');
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xffF5F5FA),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          'Wade Warren',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'hthtkhlyl24@gmail.com',
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
                        color: Color(0xffF5F5FA),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('gg');
                        },
                        child: CircleAvatar(
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
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 25),
                  child: Text(
                    'Goals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
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
                          color: Color(0xffF5F5FA),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                Text(
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
                                        icon: Icon(
                                          Icons.sports_gymnastics_sharp,
                                          color: Colors.white,
                                        )),
                                    Text(
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
                              icon: Icon(
                                Icons.add_circle_outline_sharp,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                          color: Color(0xffF5F5FA),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                Text(
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
                                        icon: Icon(
                                          Icons.sports_gymnastics_sharp,
                                          color: Colors.white,
                                        )),
                                    Text(
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
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                          color: Color(0xffF5F5FA),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                Text(
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
                                        icon: Icon(
                                          Icons.sports_gymnastics_sharp,
                                          color: Colors.white,
                                        )),
                                    Text(
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
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                          color: Color(0xffF5F5FA),
                        )),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 15),
                            child: Column(
                              children: [
                                Text(
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
                                        icon: Icon(
                                          Icons.sports_gymnastics_sharp,
                                          color: Colors.white,
                                        )),
                                    Text(
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
                              icon: Icon(
                                Icons.do_disturb_on_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

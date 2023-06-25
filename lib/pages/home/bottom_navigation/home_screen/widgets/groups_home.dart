import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/entities/entities.dart';
import 'group_page.dart';

// ignore: non_constant_identifier_names
Widget GroupsHome(Rx<Gender> checkGender) {
  return Column(
    children: [

      //Fitness
      InkWell(
        onTap: () => Get.toNamed(
          checkGender == Gender.female.obs
              ? "/FitnessWomenScreen"
              : "/FitnessMenScreen",
        ),
        child: GroupPage(
          nameGroup: 'Fitness',
          imageGroup: checkGender == Gender.male.obs
              ? "assets/images/men.jpg"
              : "assets/images/women.png",
        ),
      ),

      //Health Tips
      InkWell(
        onTap: () => Get.toNamed("/HealthTipsScreen"),
        child: GroupPage(
          nameGroup: 'Health Tips',
          imageGroup: 'assets/images/image_health_tips.jpeg',
        ),
      ),

      //GEMET
      InkWell(
        onTap: () => Get.toNamed("/ClubScreen"),
        child: GroupPage(
          nameGroup: 'Gemat',
          imageGroup: 'assets/images/image_gmet.jpeg',
        ),
      ),
    ],
  );
}

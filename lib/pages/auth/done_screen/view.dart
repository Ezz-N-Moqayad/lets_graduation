import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/entities/entities.dart';
import 'index.dart';

// ignore: must_be_immutable
class DoneScreen extends GetView<DoneController> {
  @override
  DoneController controller = Get.put(DoneController());

  DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 85),
                  child: Text(
                    'We love walk!!',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                      letterSpacing: -0.41,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Tell us something about ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: -0.41,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'You',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          letterSpacing: -0.41,
                          color: Color(0xff57CA85),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 35),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Divider(
                      color: Colors.white,
                      thickness: 4,
                      endIndent: 12,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 23, end: 135),
                  child: Text(
                    'Height  (Kg)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12, end: 16),
                  child: TextFormField(
                    controller: controller.state.HeightkgController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: const Radius.circular(10),
                    enabled: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      helperMaxLines: 1,
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF5F5F5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF5F5F5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 18, end: 135),
                  child: Text(
                    'Height  (Cm)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12, end: 16),
                  child: TextFormField(
                    controller: controller.state.HeightCmController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: const Radius.circular(10),
                    enabled: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      helperMaxLines: 1,
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF5F5F5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF5F5F5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 18, end: 135),
                  child: Text(
                    'Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 12, end: 16),
                  child: InkWell(
                    child: TextFormField(
                      onTap: () => controller.getUserLocation(),
                      controller: controller.state.LocationController,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      onChanged: (String value) {},
                      cursorColor: Colors.white,
                      cursorRadius: const Radius.circular(10),
                      enabled: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        helperMaxLines: 1,
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffF5F5F5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffF5F5F5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 18),
                  child: Text(
                    'Gender',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Radio<Gender>(
                        value: Gender.male,
                        groupValue: controller.state.selectedGender.value,
                        activeColor: const Color(0xff184E68),
                        onChanged: (v) =>
                            controller.state.selectedGender.value = Gender.male,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.only(end: 35),
                      child: Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Obx(
                      () => Radio<Gender>(
                        value: Gender.female,
                        groupValue: controller.state.selectedGender.value,
                        activeColor: const Color(0xff184E68),
                        onChanged: (v) => controller
                            .state.selectedGender.value = Gender.female,
                      ),
                    ),
                    const Text(
                      'Female',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 35, end: 13, start: 12),
                  child: ElevatedButton(
                    onPressed: () async => await controller.performDone(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: const Size(343, 48),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff184E68),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

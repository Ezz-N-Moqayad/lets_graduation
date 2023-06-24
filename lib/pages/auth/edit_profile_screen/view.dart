import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/entities/entities.dart';
import '../../../common/values/values.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

// ignore: must_be_immutable
class EditProfileScreen extends GetView<EditProfileController> {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AppBar _buildAppBar() {
      return transparentAppBar(
        title: Text(
          "Edit Profile",
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
      return Container(
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
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 25.h),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 91,
                          height: 91,
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5FA),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffF5F5FA),
                              child: Image.asset(
                                'assets/images/personal_group.png',
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 75, start: 70),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5FA),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                backgroundColor: Color(0xffF5F5FA),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Color(0xff57CA85),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(top: 23, end: 135),
                  child: Text(
                    'Name',
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
                    controller: controller.state.NameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (String value) {},
                    cursorColor: Colors.white,
                    cursorRadius: const Radius.circular(10),
                    enabled: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white),
                    decoration: InputDecoration(
                      helperMaxLines: 1,
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffF5F5F5), width: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffF5F5F5), width: 1),
                        borderRadius: BorderRadius.circular(14),
                      ),
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
                  padding:
                      EdgeInsetsDirectional.only(top: 25.h, end: 16, start: 24,bottom: 25),
                  child: ElevatedButton(
                    onPressed: () async => await controller.performSave(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: const Size(343, 48),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: const Color(0xff184E68),
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

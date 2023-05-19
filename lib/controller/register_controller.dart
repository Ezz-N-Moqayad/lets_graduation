import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;

  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  IconData visiblePassIcon = Icons.visibility;
  IconData visibleConfirmPassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController NameController;
  late TextEditingController lastNameController;
  late TextEditingController EmailController;
  late TextEditingController PasswordController;
  late TextEditingController ConfirmPasswordController;
  late TextEditingController StepsController;
  late TextEditingController HeightkController;
  late TextEditingController HeightCmController;
  late TextEditingController LocationController;
  late TextEditingController OldPasswordController;
  late TextEditingController NewPasswordController;
  late TextEditingController ConformPasswordController;
  late TextEditingController ForgetPasswordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    NameController = TextEditingController();
    lastNameController = TextEditingController();
    EmailController = TextEditingController();
    PasswordController = TextEditingController();
    ConfirmPasswordController = TextEditingController();
    StepsController = TextEditingController();
    HeightkController = TextEditingController();
    HeightCmController = TextEditingController();
    LocationController = TextEditingController();
    OldPasswordController = TextEditingController();
    NewPasswordController = TextEditingController();
    ConformPasswordController = TextEditingController();
    ForgetPasswordController = TextEditingController();
    super.onInit();
    NameController.text = "";
    lastNameController.text = "";
    EmailController.text = '';
    PasswordController.text = '';
    ConfirmPasswordController.text = '';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    NameController.dispose();
    lastNameController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
    PasswordController.dispose();
    ConfirmPasswordController.dispose();
    StepsController.dispose();
    HeightkController.dispose();
    HeightCmController.dispose();
    LocationController.dispose();
    OldPasswordController.dispose();
    NewPasswordController.dispose();
    ConformPasswordController.dispose();
    ForgetPasswordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }
}

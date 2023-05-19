import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  bool isVisiblePassCon = true;
  IconData visiblePassIcon = Icons.visibility;
  IconData visiblePassCon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late GlobalKey<FormState> formKeyPassword;
  late TextEditingController nameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    formKeyPassword = GlobalKey<FormState>();
    nameController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
    nameController.text = '';
    passwordController.text = '';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visiblePasswordCon() {
    isVisiblePassCon = !isVisiblePassCon;
    visiblePassCon = isVisiblePassCon ? Icons.visibility : Icons.visibility_off;
    update();
  }
}

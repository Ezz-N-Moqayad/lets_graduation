import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginController extends GetxController {
  final state = LoginState();

  LoginController();

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
    super.onInit();

    formKey = GlobalKey<FormState>();
    formKeyPassword = GlobalKey<FormState>();
    nameController = TextEditingController();
    passwordController = TextEditingController();

    nameController.text = '';
    passwordController.text = '';
  }

  @override
  void dispose() {
    super.dispose();

    formKey.currentState!.dispose();
    nameController.dispose();
    passwordController.dispose();
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

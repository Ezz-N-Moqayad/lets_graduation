import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ChangePasswordController extends GetxController {
  final state = ChangePasswordState();

  ChangePasswordController();

  late TextEditingController OldPasswordController;
  late TextEditingController NewPasswordController;

  @override
  void onInit() {
    super.onInit();

    OldPasswordController = TextEditingController();
    NewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    OldPasswordController.dispose();
    NewPasswordController.dispose();
  }
}

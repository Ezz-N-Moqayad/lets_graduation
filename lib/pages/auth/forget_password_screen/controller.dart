import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ForgetPasswordController extends GetxController {
  final state = ForgetPasswordState();

  ForgetPasswordController();

  late TextEditingController ForgetPassController;

  @override
  void onInit() {
    super.onInit();
    ForgetPassController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    ForgetPassController.dispose();
  }
}

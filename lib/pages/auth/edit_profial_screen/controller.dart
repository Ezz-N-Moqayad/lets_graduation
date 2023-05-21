import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class EditProfialController extends GetxController {
  final state = EditProfialState();

  EditProfialController();

  late TextEditingController EmailController;

  @override
  void onInit() {
    super.onInit();

    EmailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    EmailController.dispose();
  }
}

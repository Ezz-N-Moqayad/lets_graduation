import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class DoneController extends GetxController {
  final state = DoneState();

  DoneController();

  late TextEditingController StepsController;
  late TextEditingController HeightkController;
  late TextEditingController HeightCmController;
  late TextEditingController LocationController;

  @override
  void onInit() {
    super.onInit();

    StepsController = TextEditingController();
    HeightkController = TextEditingController();
    HeightCmController = TextEditingController();
    LocationController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    StepsController.dispose();
    HeightkController.dispose();
    HeightCmController.dispose();
    LocationController.dispose();
  }
}

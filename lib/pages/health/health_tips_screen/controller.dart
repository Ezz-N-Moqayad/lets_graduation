import 'package:get/get.dart';

import '../../../api/controllers/controllers.dart';
import 'index.dart';

class HealthTipsController extends GetxController {
  final state = HealthTipsState();

  HealthTipsController();

  @override
  void onInit() {
    super.onInit();
    state.future = HealthApiController().getHealth();
  }
}

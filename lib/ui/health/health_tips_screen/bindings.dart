import 'package:get/get.dart';
import 'index.dart';

class HealthTipsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthTipsController>(() => HealthTipsController());
  }
}

import 'package:get/get.dart';
import 'index.dart';

class DisabilityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisabilityController>(() => DisabilityController());
  }
}

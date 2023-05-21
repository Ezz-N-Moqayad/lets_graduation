import 'package:get/get.dart';
import 'index.dart';

class ScreenPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenPageController>(() => ScreenPageController());
  }
}

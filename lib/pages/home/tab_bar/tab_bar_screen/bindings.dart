import 'package:get/get.dart';
import 'index.dart';

class TabBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(() => TabBarController());
  }
}

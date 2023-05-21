import 'package:get/get.dart';
import 'index.dart';

class HelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(() => HelpController());
  }
}

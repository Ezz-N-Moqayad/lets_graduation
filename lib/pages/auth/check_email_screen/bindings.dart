import 'package:get/get.dart';
import 'index.dart';

class CheckEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckEmailController>(() => CheckEmailController());
  }
}

import 'package:get/get.dart';
import 'index.dart';

class ClubBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubController>(() => ClubController());
  }
}

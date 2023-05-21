import 'package:get/get.dart';
import 'index.dart';

class HeartBeatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeartBeatController>(() => HeartBeatController());
  }
}

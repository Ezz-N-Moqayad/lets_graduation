import 'package:get/get.dart';
import 'index.dart';

class DoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoneController>(() => DoneController());
  }
}

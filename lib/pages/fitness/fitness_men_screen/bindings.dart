import 'package:get/get.dart';
import 'index.dart';

class FitnessMenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FitnessMenController>(() => FitnessMenController());
  }
}

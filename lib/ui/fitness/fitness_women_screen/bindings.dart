import 'package:get/get.dart';
import 'index.dart';

class FitnessWomenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FitnessWomenController>(() => FitnessWomenController());
  }
}

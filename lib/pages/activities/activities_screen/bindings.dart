import 'package:get/get.dart';
import 'index.dart';

class ActivitiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivitiesController>(() => ActivitiesController());
  }
}

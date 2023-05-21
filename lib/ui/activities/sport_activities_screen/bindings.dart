import 'package:get/get.dart';
import 'index.dart';

class SportActivitiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SportActivitiesController>(() => SportActivitiesController());
  }
}

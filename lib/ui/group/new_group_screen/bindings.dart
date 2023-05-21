import 'package:get/get.dart';
import 'index.dart';

class NewGroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewGroupController>(() => NewGroupController());
  }
}

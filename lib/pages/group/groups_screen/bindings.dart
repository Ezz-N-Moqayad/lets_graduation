import 'package:get/get.dart';
import 'index.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupController>(() => GroupController());
  }
}

import 'package:get/get.dart';
import 'index.dart';

class FollowersRemoveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowersRemoveController>(() => FollowersRemoveController());
  }
}

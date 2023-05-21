import 'package:get/get.dart';
import 'index.dart';

class FollowesCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowesCheckController>(() => FollowesCheckController());
  }
}

import 'package:get/get.dart';
import 'index.dart';

class VideoViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoViewController>(() => VideoViewController());
  }
}

import 'package:get/get.dart';

import 'index.dart';

class PhotoImgViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }
}

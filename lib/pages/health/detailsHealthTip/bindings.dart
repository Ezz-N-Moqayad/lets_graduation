import 'package:get/get.dart';
import 'index.dart';

class DetailsHealthTipBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsHealthTipController>(() => DetailsHealthTipController());
  }
}

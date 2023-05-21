import 'package:get/get.dart';
import 'index.dart';

class EditProfialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfialController>(() => EditProfialController());
  }
}

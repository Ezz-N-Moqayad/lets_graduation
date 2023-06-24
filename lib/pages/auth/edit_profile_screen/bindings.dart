import 'package:get/get.dart';
import 'index.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}

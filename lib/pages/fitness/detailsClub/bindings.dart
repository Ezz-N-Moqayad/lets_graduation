import 'package:get/get.dart';
import 'index.dart';

class DetailsClubBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsClubController>(() => DetailsClubController());
  }
}

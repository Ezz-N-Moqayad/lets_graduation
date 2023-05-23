import 'package:get/get.dart';
import '../../../group/contact/index.dart';
import '../../../group/message/index.dart';
import '../../../settings/settings_screen/index.dart';
// import '../Heart_Beat/index.dart';
import '../Heart_Beat/index.dart';
import '../home_screen/index.dart';
import '../profile/index.dart';
import 'index.dart';

class BottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<HeartBeatController>(() => HeartBeatController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}

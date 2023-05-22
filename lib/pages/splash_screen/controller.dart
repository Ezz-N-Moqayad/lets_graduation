import 'package:get/get.dart';
import '../../common/routes/routes.dart';
import '../../common/store/store.dart';
import 'index.dart';

class SplashController extends GetxController {
  final state = SplashState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  handleSingIn() async {
    await ConfigStore.to.saveAlreadyOpen();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.ScreenPageView);
    });
  }
}

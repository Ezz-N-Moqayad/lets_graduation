import 'package:get/get.dart';
import '../../common/routes/routes.dart';
import '../../common/store/store.dart';
import 'index.dart';

class SplashController extends GetxController {
  final state = SplashState();

  handleSingIn() async {
    await ConfigStore.to.saveAlreadyOpen();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.ScreenPageView);
    });
  }
}

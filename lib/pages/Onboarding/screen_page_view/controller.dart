import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import 'index.dart';

class ScreenPageController extends GetxController {
  final state = ScreenPageState();

  ScreenPageController();

  changePage(int index) async {
    state.index.value = index;
  }

  handleSingIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.login);
  }
}

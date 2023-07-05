import 'package:get/get.dart';

import '../../../api/controllers/controllers.dart';
import 'index.dart';

class ClubController extends GetxController {
  final state = ClubState();

  ClubController();

  @override
  void onInit() {
    super.onInit();
    state.future = GymApiController().getGyms();
  }
}

import 'package:get/get.dart';
import '../../../api/controllers/controllers.dart';
import 'index.dart';

class FitnessWomenController extends GetxController {
  final state = FitnessWomenState();

  FitnessWomenController();

  @override
  void onInit() {
    super.onInit();
    state.future = VideoApiController().getFemaleVideos();
  }
}

import 'package:get/get.dart';
import '../../../api/controllers/controllers.dart';
import 'index.dart';

class FitnessMenController extends GetxController {
  final state = FitnessMenState();

  FitnessMenController();

  @override
  void onInit() {
    super.onInit();
    state.future = VideoApiController().getMaleVideos();
  }
}

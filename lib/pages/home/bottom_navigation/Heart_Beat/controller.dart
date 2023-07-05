import 'package:get/get.dart';

import '../../../../common/widgets/widgets.dart';
import 'index.dart';

class HeartBeatController extends GetxController {
  final state = HeartBeatState();

  HeartBeatController();

  @override
  void onInit() {
    super.onInit();
    showAccountData();

    // print('111111111111111111111111');
    // print(state.bmi.value);
    // print('111111111111111111111111');
  }

  Future<void> showAccountData() async {
    try {
      var userUpdate = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();

      if (userUpdate.docs.isNotEmpty) {
        var docData = userUpdate.docs.first.data().obs;

        final heightCm = double.parse(docData.value['heightCm']);

        double heightM = heightCm / 100.0;

        state.bmiLower.value = (18.5 * (heightM * heightM)).toInt();
        state.bmiUpper.value = (25 * (heightM * heightM)).toInt();
      }
    } catch (e) {
      toastInfo(msg: "Show Error");
    }
  }
}

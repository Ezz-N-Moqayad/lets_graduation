import 'package:get/get.dart';

import '../../../../common/widgets/widgets.dart';
import 'index.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  ProfileController();

  @override
  void onInit() async {
    super.onInit();
    await showAccountData();
  }

  Future<void> showAccountData() async {
    try {
      var userUpdate = await state.db
          .collection("users")
          .where("email", isEqualTo: state.emailFire)
          .get();

      if (userUpdate.docs.isNotEmpty) {
        var docData = userUpdate.docs.first.data().obs;

        state.name.value = docData.value['name'];
        state.email.value = docData.value['email'];
        state.photoUrl.value = docData.value['photourl'];
      }
    } catch (e) {
      toastInfo(msg: "Show Error");
    }
  }
}

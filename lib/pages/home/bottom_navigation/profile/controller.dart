import 'package:get/get.dart';

import 'index.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  ProfileController();

  @override
  void onInit() {
    super.onInit();
    showAccountData();
  }

  Future<void> showAccountData() async {
    try {
      var userUpdate = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();

      if (userUpdate.docs.isNotEmpty) {
        var docData = userUpdate.docs.first.data().obs;

        state.name.value = docData.value['name'];
        state.email.value = docData.value['email'];
        state.photoUrl.value = docData.value['photourl'];
      }
    } catch (e) {}
  }
}

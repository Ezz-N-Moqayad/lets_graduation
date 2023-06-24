import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/entities/entities.dart';
import '../../../../common/widgets/widgets.dart';
import 'index.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = HomeState();

  @override
  void onInit() {
    super.onInit();
    state.tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    CheckGender();
  }

  // ignore: non_constant_identifier_names
  Future<void> CheckGender() async {
    try {
      var user = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();

      if (user.docs.isNotEmpty) {
        var docId = user.docs.first.data().obs;
        final gender = docId.value['gender'];

        if (gender == 'Male') {
          state.checkGender = Gender.male.obs;
        } else if (gender == 'Female') {
          state.checkGender = Gender.female.obs;
        } else {
          state.checkGender = Gender.non.obs;
        }
      }
    } catch (e) {
      toastInfo(msg: "Update Error");
    }
  }

  @override
  void dispose() {
    state.tabController.dispose();
    super.dispose();
  }
}

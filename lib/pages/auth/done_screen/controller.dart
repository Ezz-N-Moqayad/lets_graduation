import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../common/models/models.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/helpers.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

class DoneController extends GetxController with Helpers {
  final state = DoneState();

  DoneController();

  @override
  void onInit() {
    super.onInit();

    state.WidthKgController = TextEditingController();
    state.HeightCmController = TextEditingController();
    state.LocationController = TextEditingController();
  }

  getUserLocation() async {
    try {
      final location = await Location().getLocation();
      String address = "${location.latitude} , ${location.longitude}";
      state.LocationController.text = address;
    } catch (e) {
      print("Getting error $e");
    }
  }

  // ignore: non_constant_identifier_names
  Future<FbResponse> updateAccount(
      {required String widthKg,
      required String heightCm,
      required String location}) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();

      if (fcmToken != null) {
        var userUpdate = await state.db
            .collection("users")
            .where("id", isEqualTo: UserStore.to.token)
            .get();

        if (userUpdate.docs.isNotEmpty) {
          var docId = userUpdate.docs.first.id;

          String gender =
              (state.selectedGender.value == Gender.male) ? 'Male' : 'Female';

          await state.db.collection("users").doc(docId).update(
            {
              "fcmtoken": fcmToken,
              "widthKg": widthKg,
              "heightCm": heightCm,
              "location": location,
              "gender": gender,
            },
          );
        }
      }
      return FbResponse(message: 'Update Successfully', states: true);
    } catch (e) {
      toastInfo(msg: "Update Error");
    }
    return FbResponse(message: 'something went wrong', states: false);
  }

  Future<void> _updateDown() async {
    FbResponse fbResponse = await updateAccount(
      widthKg: state.WidthKgController.text,
      heightCm: state.HeightCmController.text,
      location: state.LocationController.text,
    );

    showSnackBar(message: fbResponse.message, error: !fbResponse.states);
    if (fbResponse.states) Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
  }

  Future<void> performDone() async {
    if (checkData()) {
      await _updateDown();
    }
  }

  bool checkData() {
    if (state.WidthKgController.text.isNotEmpty &&
        state.HeightCmController.text.isNotEmpty &&
        state.LocationController.text.isNotEmpty &&
        state.selectedGender.value != Gender.non) {
      return true;
    }

    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  @override
  void dispose() {
    super.dispose();

    state.WidthKgController.dispose();
    state.HeightCmController.dispose();
    state.LocationController.dispose();
  }
}

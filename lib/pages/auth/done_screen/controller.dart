import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../common/entities/entities.dart';
import '../../../common/entities/fb_response.dart';
import '../../../common/routes/routes.dart';
import '../../../common/utils/helpers.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

class DoneController extends GetxController with Helpers {
  final state = DoneState();

  DoneController();

  @override
  void onInit() {
    super.onInit();

    state.HeightkgController = TextEditingController();
    state.HeightCmController = TextEditingController();
    state.LocationController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    getFmcToken();
  }

  getUserLocation() async {
    try {
      final location = await Location().getLocation();

      String address = "${location.latitude} , ${location.longitude}";

      state.LocationController.text = address;
    } catch (e) {
      // ignore: avoid_print
      print("Getting error $e");
    }
  }

  getFmcToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      var user = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();

      if (user.docs.isNotEmpty) {
        var docId = user.docs.first.id;
        await state.db
            .collection("users")
            .doc(docId)
            .update({"fcmtoken": fcmToken});
      }
    }
  }

  // ignore: non_constant_identifier_names
  Future<FbResponse> UpdateAccount(
      {required String heightKg,
      required String heightCm,
      required String location}) async {
    try {
      var userUpdate = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();

      if (userUpdate.docs.isNotEmpty) {
        var docId = userUpdate.docs.first.id;
        await state.db.collection("users").doc(docId).update({
          "heightKg": heightKg,
          "heightCm": heightCm,
          "location": location,
          "gender": state.selectedGender.value,
        });
      }

      return FbResponse(message: 'Update Successfully', states: true);
    } catch (e) {
      toastInfo(msg: "Update Error");
    }
    return FbResponse(message: 'something went wrong', states: false);
  }

  Future<void> _updateDown() async {
    FbResponse fbResponse = await UpdateAccount(
        heightKg: state.HeightkgController.text,
        heightCm: state.HeightCmController.text,
        location: state.LocationController.text);
    showSnackBar(message: fbResponse.message, error: !fbResponse.states);
    if (fbResponse.states) Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
  }

  Future<void> performDone() async {
    if (checkData()) {
      await _updateDown();
    }
  }

  bool checkData() {
    if (state.HeightkgController.text.isNotEmpty &&
        state.HeightCmController.text.isNotEmpty &&
        state.LocationController.text.isNotEmpty &&
        state.selectedGender.value == Gender.non) {
      return true;
    }

    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  @override
  void dispose() {
    super.dispose();

    state.HeightkgController.dispose();
    state.HeightCmController.dispose();
    state.LocationController.dispose();
  }
}

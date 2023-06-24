import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../common/entities/entities.dart';
import '../../../common/entities/fb_response.dart';
import '../../../common/routes/routes.dart';
import '../../../common/utils/helpers.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

class EditProfileController extends GetxController with Helpers {
  final state = EditProfileState();

  EditProfileController();

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

        final name = docData.value['name'];
        final heightKg = docData.value['heightKg'];
        final heightCm = docData.value['heightCm'];
        final location = docData.value['location'];
        final gender = docData.value['gender'];

        state.NameController.text = name;
        state.HeightkgController.text = heightKg;
        state.HeightCmController.text = heightCm;
        state.LocationController.text = location;

        state.selectedGender.value =
            gender == 'Male' ? Gender.male : Gender.female;
      }
    } catch (e) {
      toastInfo(msg: "Show Error");
    }
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

  // ignore: non_constant_identifier_names
  Future<FbResponse> UpdateAccount({
    required String name,
    required String heightKg,
    required String heightCm,
    required String location,
  }) async {
    try {
      var userUpdate = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();

      if (userUpdate.docs.isNotEmpty) {
        var docId = userUpdate.docs.first.id;

        Gender gender = state.selectedGender.value;
        await state.db.collection("users").doc(docId).update(
          {
            "name": name,
            "heightKg": heightKg,
            "heightCm": heightCm,
            "location": location,
            "gender": await gender == Gender.male ? "Male" : "Female",
          },
        );
      }

      return FbResponse(message: 'Update Successfully', states: true);
    } catch (e) {
      toastInfo(msg: "Update Error");
    }
    return FbResponse(message: 'something went wrong', states: false);
  }

  Future<void> performSave() async {
    if (checkData()) {
      await _updateDown();
    }
  }

  Future<void> _updateDown() async {
    FbResponse fbResponse = await UpdateAccount(
        name: state.NameController.text,
        heightKg: state.HeightkgController.text,
        heightCm: state.HeightCmController.text,
        location: state.LocationController.text);
    showSnackBar(message: fbResponse.message, error: !fbResponse.states);
    if (fbResponse.states) Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
  }

  bool checkData() {
    if (state.NameController.text.isNotEmpty &&
        state.HeightkgController.text.isNotEmpty &&
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

    state.NameController.dispose();
    state.HeightkgController.dispose();
    state.HeightCmController.dispose();
    state.LocationController.dispose();
  }
}

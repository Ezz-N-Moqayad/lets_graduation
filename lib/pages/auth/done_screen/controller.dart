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

  // @override
  // void onReady() {
  //   super.onReady();
  //   getFmcToken();
  // }

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
    print("11111111111111111111111111");
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("2222222222222");

    print(fcmToken);
    print("2222222222222");

    if (fcmToken != null) {
      print("33333333333333333333");

      print(fcmToken);
      print("33333333333333333333");

      var user = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();
      print("444444444444444444");

      print(user);
      print("444444444444444444");

      if (user.docs.isNotEmpty) {
        print("555555555555555555555555");

        var doc_id = user.docs.first.id;
        print("66666666666666666666666");
        print(doc_id);
        print("66666666666666666666666");
        await state.db
            .collection("users")
            .doc(doc_id)
            .update({"fcmtoken": fcmToken});
        print("77777777777777777777777");
      }
    }
  }

  // ignore: non_constant_identifier_names
  Future<FbResponse> UpdateAccount(
      {required String heightKg,
      required String heightCm,
      required String location}) async {
    print("rrrrrrrrrrrrrrrrrrrrrrrr");

    try {
      print("tttttttttttttttttttttttttttttt");

      var userUpdate = await state.db
          .collection("users")
          .where("id", isEqualTo: state.token)
          .get();
      print("yyyyyyyyyyyyyyyyyyyyyyyyy");
      print(userUpdate.docs);
      print("yyyyyyyyyyyyyyyyyyyyyyyyy");

      if (userUpdate.docs.isNotEmpty) {
        print("uuuuuuuuuuuuuuuuuuuuuuuuuuu");

        var docId = userUpdate.docs.first.id;

        String gender = await (state.selectedGender.value == Gender.male)
            ? 'Male'
            : 'Female';
        print("iiiiiiiiiiiiiiiiii");

        await state.db.collection("users").doc(docId).update({
          "heightKg": heightKg,
          "heightCm": heightCm,
          "location": location,
          "gender": gender,
        });
        print("oooooooooooooooooooooo");
        getFmcToken();
      }

      return FbResponse(message: 'Update Successfully', states: true);
    } catch (e) {
      toastInfo(msg: "Update Error");
    }
    return FbResponse(message: 'something went wrong', states: false);
  }

  Future<void> _updateDown() async {
    print("wwwwwwwwwwwwwwwwwwwwwwww");

    FbResponse fbResponse = await UpdateAccount(
      heightKg: state.HeightkgController.text,
      heightCm: state.HeightCmController.text,
      location: state.LocationController.text,
    );
    print("eeeeeeeeeeeeeeeeeeeeeeeeee");

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
        state.selectedGender.value != Gender.non) {
      print("qqqqqqqqqqqqqqqqqqq");

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

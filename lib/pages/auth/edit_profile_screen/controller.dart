import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';

import '../../../common/models/models.dart';
import '../../../common/routes/routes.dart';
import '../../../common/utils/utils.dart';
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

  Future<XFile?> imgFromGallery() async {
    final pickedFile = await state.picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      state.photo = File(pickedFile.path);
      return XFile(pickedFile.path);
    }
    return null;
  }

  Future getImgUrl(String name) async {
    final spaceRef = FirebaseStorage.instance.ref("User Photos").child(name);
    var str = await spaceRef.getDownloadURL();
    return str;
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
        final widthKg = docData.value['widthKg'];
        final heightCm = docData.value['heightCm'];
        final location = docData.value['location'];
        final photoUrl = docData.value['photourl'];
        final gender = docData.value['gender'];

        state.NameController.text = name;
        state.WidthKgController.text = widthKg;
        state.HeightCmController.text = heightCm;
        state.LocationController.text = location;
        state.photoUrl.value = photoUrl;
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
    } catch (e) {}
  }

  Future uploadFile({
    required String docId,
    required String name,
    required String widthKg,
    required String heightCm,
    required String location,
    required String gender,
  }) async {
    if (state.photo == null) return;
    final fileName = getRandomString(15) + extension(state.photo!.path);
    try {
      final ref = FirebaseStorage.instance.ref("User Photos").child(fileName);
      await ref.putFile(state.photo as File).snapshotEvents.listen(
        (event) async {
          switch (event.state) {
            case TaskState.running:
              break;
            case TaskState.paused:
              break;
            case TaskState.canceled:
              break;
            case TaskState.error:
              break;
            case TaskState.success:
              String imgUrl = await getImgUrl(fileName);

              await state.db.collection("users").doc(docId).update(
                {
                  "name": name,
                  "widthKg": widthKg,
                  "heightCm": heightCm,
                  "location": location,
                  "gender": gender,
                  "photourl": imgUrl,
                },
              );
          }
        },
      );
    } catch (e) {}
  }

  // ignore: non_constant_identifier_names
  Future<FbResponse> UpdateAccount({
    required String name,
    required String widthKg,
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

        uploadFile(
          docId: docId,
          name: name,
          widthKg: widthKg,
          heightCm: heightCm,
          location: location,
          gender: await gender == Gender.male ? "Male" : "Female",
        );

        await state.db.collection("users").doc(docId).update(
          {
            "name": name,
            "widthKg": widthKg,
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
      FbResponse fbResponse = await UpdateAccount(
          name: state.NameController.text,
          widthKg: state.WidthKgController.text,
          heightCm: state.HeightCmController.text,
          location: state.LocationController.text);
      showSnackBar(message: fbResponse.message, error: !fbResponse.states);
      if (fbResponse.states)
        Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
    }
  }

  bool checkData() {
    if (state.NameController.text.isNotEmpty &&
        state.WidthKgController.text.isNotEmpty &&
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
    state.WidthKgController.dispose();
    state.HeightCmController.dispose();
    state.LocationController.dispose();
  }
}

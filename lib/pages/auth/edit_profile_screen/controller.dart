import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';

import '../../../common/models/models.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
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
          .where("email", isEqualTo: state.email)
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
    required String id,
    required String name,
    required String widthKg,
    required String heightCm,
    required String location,
    required String gender,
  }) async {
    print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');

    if (state.photo == null) return;
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwww');

    final fileName = getRandomString(15) + extension(state.photo!.path);
    try {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeee');

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
              print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');

              await state.db.collection("users").doc(id).update(
                {
                  "name": name,
                  "widthKg": widthKg,
                  "heightCm": heightCm,
                  "location": location,
                  "gender": gender,
                  "photourl": imgUrl,
                },
              );
              print('tttttttttttttttttttttttttttttttttttttttt');
              print(imgUrl);
              print('tttttttttttttttttttttttttttttttttttttttt');

              UserData userProfile = UserData();
              userProfile.accessToken = UserStore.to.profile.accessToken;
              userProfile.id = id;
              userProfile.name = name;
              userProfile.email = UserStore.to.profile.email;
              userProfile.password = UserStore.to.profile.password;
              userProfile.photourl = imgUrl;
              userProfile.widthKg = widthKg;
              userProfile.heightCm = heightCm;
              userProfile.location = location;
              userProfile.gender = gender;
              userProfile.fcmtoken = UserStore.to.profile.fcmtoken;
              print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyy');

              await UserStore.to.saveProfile(userProfile);
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
          .where("email", isEqualTo: state.email)
          .get();
      print('1111111111111111111111111asasasasasa');

      if (userUpdate.docs.isNotEmpty) {
        var docId = userUpdate.docs.first.id;
        print('222222222222222222222222222');

        Gender gender = state.selectedGender.value;
        print(gender);
        print('222222222222222222222222222');
        print(gender == Gender.male ? "Male" : "Female");

        print('222222222222222222222222222');

        await state.db.collection("users").doc(docId).update(
          {
            "name": name,
            "widthKg": widthKg,
            "heightCm": heightCm,
            "location": location,
            "gender": await gender == Gender.male ? "Male" : "Female",
          },
        );
        print('33333333333333333333333333333');

        UserData userProfile = UserData();
        userProfile.accessToken = UserStore.to.profile.accessToken;
        userProfile.id = docId;
        userProfile.name = name;
        userProfile.email = UserStore.to.profile.email;
        userProfile.password = UserStore.to.profile.password;
        userProfile.photourl = UserStore.to.profile.photourl;
        userProfile.widthKg = widthKg;
        userProfile.heightCm = heightCm;
        userProfile.location = location;
        userProfile.gender = await gender == Gender.male ? "Male" : "Female";
        userProfile.fcmtoken = UserStore.to.profile.fcmtoken;
        print('44444444444444444444444444');

        await UserStore.to.saveProfile(userProfile);
        print('55555555555555555555555555555555');

        uploadFile(
          id: docId,
          name: name,
          widthKg: widthKg,
          heightCm: heightCm,
          location: location,
          gender: await gender == Gender.male ? "Male" : "Female",
        );
        print('66666666666666666666666666666666');
      }

      return FbResponse(message: 'Update Successfully', states: true);
    } catch (e) {
      print('777777777777777777777777777');

      toastInfo(msg: "Update Error");
    }
    print('8888888888888888888888888888888');

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
      if (fbResponse.states) {
        Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
      }
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

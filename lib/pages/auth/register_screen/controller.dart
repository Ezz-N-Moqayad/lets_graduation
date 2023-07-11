import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../common/models/models.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/utils.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class RegisterController extends GetxController with Helpers {
  final state = RegisterState();

  RegisterController();

  @override
  void onInit() {
    super.onInit();

    state.NameController = TextEditingController();
    state.EmailController = TextEditingController();
    state.PasswordController = TextEditingController();
    state.ConfirmPasswordController = TextEditingController();

    state.EmailController.text = '';
    state.NameController.text = "";
    state.PasswordController.text = '';
    state.ConfirmPasswordController.text = '';

    generateAccessToken();
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {});
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

  String generateAccessToken() {
    final random = Random.secure();
    return List.generate(21, (_) => random.nextInt(10).toString()).join();
  }

  Future getImgUrl(String name) async {
    final spaceRef = FirebaseStorage.instance.ref("User Photos").child(name);
    var str = await spaceRef.getDownloadURL();
    return str;
  }

  // ignore: non_constant_identifier_names
  void AddUser(UserData userProfile) async {
    UserStore.to.saveProfile(userProfile);
    var userbase = await state.db
        .collection("users")
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options) => userdata.toFirestore())
        .where("id", isEqualTo: userProfile.id)
        .get();

    if (userbase.docs.isEmpty) {
      final data = UserData(
          id: userProfile.id,
          name: userProfile.name,
          email: userProfile.email,
          photourl: userProfile.photourl,
          password: userProfile.password,
          gender: userProfile.gender,
          location: userProfile.location,
          widthKg: userProfile.widthKg,
          heightCm: userProfile.heightCm,
          fcmtoken: userProfile.fcmtoken,
          addtime: Timestamp.now());

      await state.db
          .collection("users")
          .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore())
          .add(data);
    }

    toastInfo(msg: "Account Added successfully");
  }

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        final gAuthentication = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: gAuthentication.idToken,
          accessToken: gAuthentication.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        var userUpdate = await state.db
            .collection("users")
            .where("id", isEqualTo: user.id)
            .get();

        UserData userProfile = UserData();

        userProfile.id = user.id;
        userProfile.name = user.displayName ?? user.email;
        userProfile.email = user.email;
        userProfile.photourl = user.photoUrl ?? "";

        if (userUpdate.docs.isNotEmpty) {
          var docData = userUpdate.docs.first.data().obs;

          userProfile.password = docData.value['password'];
          userProfile.widthKg = docData.value['widthKg'];
          userProfile.heightCm = docData.value['heightCm'];
          userProfile.location = docData.value['location'];
          userProfile.gender = docData.value['gender'];
          userProfile.fcmtoken = docData.value['fcmtoken'];

          await UserStore.to.saveProfile(userProfile);

          toastInfo(msg: "Login successfully");
          Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
        } else {
          userProfile.password = "";
          userProfile.widthKg = "";
          userProfile.heightCm = "";
          userProfile.location = "";
          userProfile.gender = "";
          userProfile.fcmtoken = "";

          AddUser(userProfile);
          Get.offAndToNamed(AppRoutes.done);
        }
      }
    } catch (e) {
      toastInfo(msg: "Login Error");
    }
  }

  Future uploadFile({
    required String name,
    required String email,
    required String password,
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

              var userUpdate = await state.db
                  .collection("users")
                  .where("email", isEqualTo: email)
                  .get();

              UserData userProfile = UserData();

              userProfile.id = generateAccessToken();
              userProfile.email = email;
              userProfile.name = name;
              userProfile.photourl = imgUrl;
              userProfile.password = password;
              userProfile.widthKg = "";
              userProfile.heightCm = "";
              userProfile.location = "";
              userProfile.gender = "";
              userProfile.fcmtoken = "";

              AddUser(userProfile);
          }
        },
      );
    } catch (e) {}
  }

  // ignore: non_constant_identifier_names
  Future<FbResponse> CreateAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await state.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();

        uploadFile(name: name, email: email, password: password);

        return FbResponse(
            message: 'Account Created Successfully', states: true);
      }
    } catch (e) {
      toastInfo(msg: "Login Error");
    }
    return FbResponse(message: 'something went wrong', states: false);
  }

  bool checkData() {
    if (state.NameController.text.isNotEmpty &&
        state.EmailController.text.isNotEmpty &&
        state.PasswordController.text.isNotEmpty &&
        state.ConfirmPasswordController.text.isNotEmpty) {
      if (state.photo == null) {
        showSnackBar(message: 'Please add a photo', error: true);
        return false;
      }
      if (state.PasswordController.text !=
          state.ConfirmPasswordController.text) {
        showSnackBar(message: 'Passwords do not match!', error: true);
        return false;
      }
      return true;
    }

    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    FbResponse fbResponse = await CreateAccount(
        email: state.EmailController.text,
        password: state.PasswordController.text,
        name: state.NameController.text);
    showSnackBar(message: fbResponse.message, error: !fbResponse.states);
    if (fbResponse.states) Get.offAndToNamed(AppRoutes.done);
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await _register();
    }
  }

  @override
  void dispose() {
    super.dispose();

    state.NameController.dispose();
    state.EmailController.dispose();
    state.PasswordController.dispose();
    state.ConfirmPasswordController.dispose();
  }
}

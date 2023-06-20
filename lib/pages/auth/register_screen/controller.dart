import 'dart:js_interop';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../common/entities/entities.dart';
import '../../../common/entities/fb_response.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/helpers.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class RegisterController extends GetxController with Helpers {
  final state = RegisterState();

  RegisterController();

  final db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
  }

  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        final _gAuthentication = await user.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _gAuthentication.idToken,
          accessToken: _gAuthentication.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(_credential);

        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photoUrl;

        AddUser(userProfile);

        toastInfo(msg: "Login Success");
        Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
      }
    } catch (e) {
      toastInfo(msg: "Login Error");
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print("User is currently logged out");
        } else {
          print("User is logged in");
        }
      },
    );
  }

  void AddUser(UserLoginResponseEntity userProfile) async {
    UserStore.to.saveProfile(userProfile);
    var userbase = await db
        .collection("users")
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options) => userdata.toFirestore())
        .where("id", isEqualTo: userProfile.accessToken)
        .get();

    if (userbase.docs.isEmpty) {
      final data = UserData(
          id: userProfile.accessToken,
          name: userProfile.displayName,
          email: userProfile.email,
          photourl: userProfile.photoUrl,
          location: "",
          fcmtoken: "",
          addtime: Timestamp.now());

      await db
          .collection("users")
          .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userdata, options) =>
                  userdata.toFirestore())
          .add(data);
    }

    toastInfo(msg: "Added successfully");
  }

  // ignore: non_constant_identifier_names
  Future<FbResponse> CreateAccount(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();

        print("11111111111111111");
        print(userCredential.user);
        print("11111111111111111");


        final random = Random.secure();
        final bytes = List<int>.generate(16, (index) => random.nextInt(256));
        final accessToken =  base64Url.encode(bytes );

        print("11111111111111111");
        print(accessToken);
        print("11111111111111111");
        return FbResponse(
            message: 'Account Created Successfully', states: true);
      }


      // UserLoginResponseEntity userProfile = UserLoginResponseEntity();
      // userProfile.email = email;
      //
      // userProfile.displayName = name;
      // userProfile.photoUrl = "";
      //
      // AddUser(userProfile);
    } catch (e) {
      toastInfo(msg: "Login Error");
    }
    return FbResponse(message: 'something went wrong', states: false);
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await _register();
    }
  }

  bool checkData() {
    if (state.NameController.text.isNotEmpty &&
        state.EmailController.text.isNotEmpty &&
        state.PasswordController.text.isNotEmpty &&
        state.ConfirmPasswordController.text.isNotEmpty) {
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
    if (fbResponse.states) Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
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

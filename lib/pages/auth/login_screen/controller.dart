import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../api/controllers/login_api_controller.dart';
import '../../../common/models/models.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/utils/helpers.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class LoginController extends GetxController with Helpers {
  final state = LoginState();

  LoginController();

  @override
  void onInit() {
    super.onInit();

    state.formKey = GlobalKey<FormState>();
    state.formKeyPassword = GlobalKey<FormState>();
    state.emailController = TextEditingController();
    state.passwordController = TextEditingController();
    state.emailController.text = '';
    state.passwordController.text = '';
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {});
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

  // ignore: non_constant_identifier_names
  Future<FbResponse> SignIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await state.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        String? status = await LoginApiController().login(
          email: email,
          password: password,
        );

        if (status!.isNotEmpty) {
          String message = userCredential.user!.emailVerified
              ? 'your must verify your email'
              : 'logged In Successfully';

          var userUpdate = await state.db
              .collection("users")
              .where("email", isEqualTo: email)
              .get();

          if (userUpdate.docs.isNotEmpty) {
            var docData = userUpdate.docs.first.data().obs;

            UserData userProfile = UserData();
            userProfile.accessToken = status;
            userProfile.id = docData.value['id'];
            userProfile.name = docData.value['name'];
            userProfile.email = docData.value['email'];
            userProfile.password = docData.value['password'];
            userProfile.photourl = docData.value['photourl'];
            userProfile.widthKg = docData.value['widthKg'];
            userProfile.heightCm = docData.value['heightCm'];
            userProfile.location = docData.value['location'];
            userProfile.gender = docData.value['gender'];
            userProfile.fcmtoken = docData.value['fcmtoken'];

            await UserStore.to.saveProfile(userProfile);

            bool states = userCredential.user!.emailVerified;
            return FbResponse(message: message, states: !states);
          }
        }
      }
    } catch (e) {
      toastInfo(msg: "Login Error");
    }

    return FbResponse(message: 'somthing went worng', states: false);
  }

  bool checkData() {
    if (state.emailController.text.isNotEmpty &&
        state.passwordController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    FbResponse fbResponse = await SignIn(
      email: state.emailController.text,
      password: state.passwordController.text,
    );

    showSnackBar(message: fbResponse.message, error: !fbResponse.states);

    if (fbResponse.states) Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await _login();
    }
  }

  @override
  void dispose() {
    super.dispose();

    // ignore: invalid_use_of_protected_member
    state.formKey.currentState!.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
  }
}

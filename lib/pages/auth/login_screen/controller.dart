import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/widgets/widgets.dart';
import 'index.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class LoginController extends GetxController {
  final state = LoginState();

  LoginController();

  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  bool isVisiblePassCon = true;
  IconData visiblePassIcon = Icons.visibility;
  IconData visiblePassCon = Icons.visibility;

  final db = FirebaseFirestore.instance;

  late GlobalKey<FormState> formKey;
  late GlobalKey<FormState> formKeyPassword;
  late TextEditingController nameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();

    formKey = GlobalKey<FormState>();
    formKeyPassword = GlobalKey<FormState>();
    nameController = TextEditingController();
    passwordController = TextEditingController();

    nameController.text = '';
    passwordController.text = '';
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

        UserStore.to.saveProfile(userProfile);
        var userbase = await db
            .collection("users")
            .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore())
            .where("id", isEqualTo: id)
            .get();

        if (userbase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photourl: photoUrl,
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

  @override
  void dispose() {
    super.dispose();

    formKey.currentState!.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visiblePasswordCon() {
    isVisiblePassCon = !isVisiblePassCon;
    visiblePassCon = isVisiblePassCon ? Icons.visibility : Icons.visibility_off;
    update();
  }
}

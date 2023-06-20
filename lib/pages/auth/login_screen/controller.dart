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

class LoginController extends GetxController with Helpers {
  final state = LoginState();

  LoginController();

  final db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  Future<FbResponse> SignIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        String message = userCredential.user!.emailVerified
            ? 'logged In Successfully'
            : 'your must verify your email';
        return FbResponse(
            message: message, states: userCredential.user!.emailVerified);
      }
    } on FirebaseAuthException catch (e) {
      return _ControlFirebaseException(e);
    }

    return FbResponse(message: 'somthing went worng', states: false);
  }

  FbResponse _ControlFirebaseException(FirebaseException exception) {
    print('Message:${exception.message}');
    if (exception.code == 'email-already-in-use') {
    } else if (exception.code == 'invalid-email') {
    } else if (exception.code == 'operation-not-allowed') {
    } else if (exception.code == 'weak-password') {
    } else if (exception.code == 'user-disabled') {
    } else if (exception.code == 'user-not-found') {
    } else if (exception.code == 'wrong-password') {
    } else if (exception.code == 'auth/invalid-email') {
    } else if (exception.code == 'auth/user-not-email') {}
    return FbResponse(
        message: exception.message ?? 'Error occurred!', states: false);
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await _login();
    }
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
        password: state.passwordController.text);

    showSnackBar(message: fbResponse.message, error: !fbResponse.states);

    if (fbResponse.states) Get.offAndToNamed(AppRoutes.BottomNavigationScreen);
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

    // ignore: invalid_use_of_protected_member
    state.formKey.currentState!.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
  }
}

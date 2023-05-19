import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lets_graduation/utils/app_color.dart';
import 'package:lets_graduation/utils/app_text.dart';
import 'package:lets_graduation/utils/components.dart';
import 'package:lets_graduation/utils/constants.dart';
import 'preferences_manager.dart';

class AppHelper {
  static String? getCurrentUserToken() {
    if (PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  // static User? getCurrentUser() {
  //   if (PreferencesManager.getUserData(key: Const.KEY_USER_DATA) != null) {
  //     return PreferencesManager.getUserData(key: Const.KEY_USER_DATA);
  //   } else {
  //     return null;
  //   }
  // }

  static String getAppLanguage() {
    if (PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != null &&
        PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != "") {
      String language = PreferencesManager.getAppData(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR)
        return Const.KEY_LANGUAGE_AR;
      else if (language == Const.KEY_LANGUAGE_EN) return Const.KEY_LANGUAGE_EN;
    }
    return Const.KEY_LANGUAGE_AR;
  }

  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  static bool validate({required String value}) {
    if (GetUtils.isBlank(value)!)
      return false;
    else
      return true;
  }

  static String? validateUserName({required String name}) {
    if (name.isEmpty) {
      return 'enter_username'.tr;
    } else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'enter_phone'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else
      return null;
  }

  static String? validateConfirmPassword(
      {required String password, required String conformPassword}) {
    if (GetUtils.isBlank(conformPassword)!)
      return 'enter_confirm_password'.tr;
    else if (conformPassword.length < 6)
      return 'Password_characters'.tr;
    else if (password != conformPassword) return 'Passwords do not match'.tr;
    return null;
  }

  static String? validateName({required name}) {
    if (GetUtils.isBlank(name)!)
      return 'enter_name'.tr;
    else if (!AppHelper.emailValidate().hasMatch(name))
      return 'enter__valid_name'.tr;
    else
      return null;
  }

  static String? validateEmail({required email}) {
    if (GetUtils.isBlank(email)!)
      return 'enter_email'.tr;
    else if (!AppHelper.emailValidate().hasMatch(email))
      return 'enter_email'.tr;
    else
      return null;
  }

  static String formatImage(String pathImage) {
    if (pathImage.contains('\\'))
      return pathImage.replaceAll('\\', '/');
    else
      return pathImage;
  }

  static String getUserImage(String pathImage) {
    // print('getUserImage: $pathImage');
    if (pathImage.contains(Const.imagePath))
      return formatImage(pathImage);
    else
      return formatImage('${Const.imagePath}$pathImage');
  }

  static String getUserLatitude() {
    print(
        'getUserLatitude :${PreferencesManager.getAppData(key: Const.KEY_CURRENT_LATITUDE)}');
    if (PreferencesManager.getAppData(key: Const.KEY_CURRENT_LATITUDE) != null)
      return PreferencesManager.getAppData(key: Const.KEY_CURRENT_LATITUDE)
          .toString();
    else
      return '';
  }

  static String getUserLongitude() {
    print(
        'getUserLongitude :${PreferencesManager.getAppData(key: Const.KEY_CURRENT_LONGITUD)}');
    if (PreferencesManager.getAppData(key: Const.KEY_CURRENT_LONGITUD) != null)
      return PreferencesManager.getAppData(key: Const.KEY_CURRENT_LONGITUD)
          .toString();
    else
      return '';
  }

  static double calculateDistance(
      {required fromLat, required fromLon, required toLat, required toLon}) {
    // print("LOCA FROM calculateDistance: $fromLat,$fromLon");
    // print("LOCA TO calculateDistance: $toLat,$toLon");
    // TODO 25.380035, 49.588793
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((toLat - fromLat) * p) / 2 +
        cos(fromLat * p) *
            cos(toLat * p) *
            (1 - cos((toLon - fromLon) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  /*
  * static double calculateDistance({required fromLat, required fromLon, required toLat, required toLon}){
    print("LOCA calculateDistance: $fromLat,$fromLon");
    // TODO 25.380035, 49.588793
    var p = 0.017453292519943295;
    var a = 0.5 - cos((toLat - fromLat == null ? 25.380035 : fromLat) * p)/2 +
        cos(fromLat == null ? 25.380035 : fromLat * p) * cos(toLat * p) *
            (1 - cos((toLon - fromLon == null ? 49.588793 : fromLon ) * p))/2;
    return 12742 * asin(sqrt(a));
  }
  *
  * */

  static int getPlaceItemSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550
        ? /* TODO PHONE */ 2
        : /* TODO TABLET */ 3;
  }

  static double getDialogSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550
        ? /* TODO PHONE */ 250
        : /* TODO TABLET */ 280;
  }

  static double getDialogLanguageSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550
        ? /* TODO PHONE */ 210
        : /* TODO TABLET */ 280;
  }

  static double getBottomSheetSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550
        ? /* TODO PHONE */ 320
        : /* TODO TABLET */ 380;
  }

  static void showToast(
      {required String message,
      Color color = Colors.black,
      ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
              clipBehavior: Clip.antiAlias,
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                height: 300.h,
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsetsDirectional.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(
                        text: 'please_login_dear_user'.tr,
                        color: AppColors.lightBurgundy,
                        fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 8.r),
                        height: 150.h,
                        width: 230.w,
                        child: Image.asset('${Const.images}image_login.png',
                            fit: BoxFit.cover)),
                    Spacer(),
                    Container(
                        child: AppWidgets.CustomButton(
                            height: 52,
                            background: AppColors.lightBurgundy,
                            borderColor: AppColors.lightBurgundy,
                            text: 'sign_in'.tr,
                            click: () {
                              goToLogin();
                            })),
                  ],
                ),
              ),
            ));
  }

  static void goToLogin() {
    PreferencesManager.clearData(key: Const.KEY_LATITUDE);
    PreferencesManager.clearData(key: Const.KEY_LONGITUD);
    PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
    PreferencesManager.clearData(key: Const.KEY_USER_DATA);
    // HomeController controller = Get.put(HomeController());
    // controller.getCurrenNavIndex(navIndex: 0);
    // Get.offAndToNamed(Routes.login);
  }

  static String getDeviceName() {
    if (PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME) != null)
      return PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME);
    else
      return '';
  }

  static Future getDeviceNameFromSystem() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: androidInfo.model);
      print('Running on Android ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: iosInfo.utsname.machine);
      print('Running on IOS ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    }
  }

  static String getCurrncy() {
    if (getAppLanguage() == "ar") {
      return Const.currencyAR;
    } else {
      return Const.currencyEN;
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..connectionTimeout
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

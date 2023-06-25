import 'package:flutter/material.dart';
import '../../common/routes/routes.dart';
import '../store/store.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {

  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.login ||
        route == AppRoutes.Splash) {
      return null;
    } else {
      Future.delayed(
          const Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}

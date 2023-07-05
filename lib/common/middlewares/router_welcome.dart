import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/routes/routes.dart';
import '../store/store.dart';

class RouteWelcomeMiddleware extends GetMiddleware {

  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.BottomNavigationScreen);
    } else {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}

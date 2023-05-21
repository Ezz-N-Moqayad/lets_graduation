import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/routes/routes.dart';
import 'utils/app_helper.dart';
import 'utils/local.dart';
import 'utils/preferences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await AppHelper.getDeviceNameFromSystem();
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyTranslations(),
        initialRoute: AppPages.splash,
        getPages: AppPages.routes,
      ),
    );
  }
}

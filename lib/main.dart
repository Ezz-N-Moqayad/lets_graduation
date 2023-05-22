import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'common/utils/preferences_manager.dart';
import 'common/services/services.dart';
import 'common/utils/app_helper.dart';
import 'common/routes/routes.dart';
import 'common/store/store.dart';
import 'common/utils/local.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

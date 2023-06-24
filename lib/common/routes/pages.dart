import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/Onboarding/screen_page_view/index.dart';
import '../../pages/auth/edit_profile_screen/index.dart';
import '../../pages/fitness/videoView/index.dart';
import '../../pages/group/contact/index.dart';
import '../../pages/group/message/chat/index.dart';
import '../../pages/group/message/photoview/index.dart';
import '../../pages/home/bottom_navigation/Bottom_Navigation/index.dart';
import '../../pages/activities/sport_activities_screen/index.dart';
import '../../pages/followers/followers_remove_screen/index.dart';
import '../../pages/followers/followers_check_screen/index.dart';
import '../../pages/fitness/fitness_women_screen/index.dart';
import '../../pages/activities/activities_screen/index.dart';
import '../../pages/activities/disability_screen/index.dart';
import '../../pages/auth/change_password_screen/index.dart';
import '../../pages/auth/forget_password_screen/index.dart';
import '../../pages/fitness/fitness_men_screen/index.dart';
import '../../pages/health/health_tips_screen/index.dart';
import '../../pages/settings/settings_screen/index.dart';
import '../../pages/auth/check_email_screen/index.dart';
import '../../pages/group/new_group_screen/index.dart';
import '../../pages/settings/about_screen/index.dart';
import '../../pages/auth/register_screen/index.dart';
import '../../pages/settings/help_screen/index.dart';
import '../../pages/group/groups_screen/index.dart';
import '../../pages/fitness/club_screen/index.dart';
import '../../pages/auth/login_screen/index.dart';
import '../../pages/auth/done_screen/index.dart';
import '../../pages/splash_screen/index.dart';
import '../middlewares/middlewares.dart';
import 'routes.dart';

class AppPages {
  static const splash = AppRoutes.Splash;
  static const Application = AppRoutes.BottomNavigationScreen;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: AppRoutes.ScreenPageView,
      page: () => const ScreenPageView(),
      binding: ScreenPageBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.done,
      page: () => DoneScreen(),
      binding: DoneBinding(),
    ),
    GetPage(
      name: AppRoutes.changepassword,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.activitiesSport,
      page: () => const SportActivitiesScreen(),
      binding: SportActivitiesBinding(),
    ),
    GetPage(
      name: AppRoutes.disability,
      page: () => const DisabilityScreen(),
      binding: DisabilityBinding(),
    ),
    GetPage(
      name: AppRoutes.BottomNavigationScreen,
      page: () => const BottomNavigationScreen(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.ForgetPassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.checkemail,
      page: () => const CheckEmailScreen(),
      binding: CheckEmailBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfial,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.Setting,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.About,
      page: () => const AboutScreen(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: AppRoutes.Help,
      page: () => const HelpScreen(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: AppRoutes.FollowersRemove,
      page: () => const FollowersRemoveScreen(),
      binding: FollowersRemoveBinding(),
    ),
    GetPage(
      name: AppRoutes.FollowesCheck,
      page: () => const FollowesCheckScreen(),
      binding: FollowesCheckBinding(),
    ),
    GetPage(
      name: AppRoutes.GroupScreen,
      page: () => const GroupScreen(),
      binding: GroupBinding(),
    ),
    GetPage(
      name: AppRoutes.ContactPage,
      page: () => const ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.Chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Photoimgview,
      page: () => const PhotoImgViewPage(),
      binding: PhotoImgViewBinding(),
    ),
    GetPage(
      name: AppRoutes.NewGroup,
      page: () => const NewGroupScreen(),
      binding: NewGroupBinding(),
    ),
    GetPage(
      name: AppRoutes.Activities,
      page: () => const ActivitiesScreen(),
      binding: ActivitiesBinding(),
    ),
    GetPage(
      name: AppRoutes.HealthTipsScreen,
      page: () => const HealthTipsScreen(),
      binding: HealthTipsBinding(),
    ),
    GetPage(
      name: AppRoutes.FitnessMenScreen,
      page: () => FitnessMenScreen(),
      binding: FitnessMenBinding(),
    ),
    GetPage(
      name: AppRoutes.FitnessWomenScreen,
      page: () => FitnessWomenScreen(),
      binding: FitnessWomenBinding(),
    ),
    GetPage(
      name: AppRoutes.ClubScreen,
      page: () => ClubScreen(),
      binding: ClubBinding(),
    ),
    GetPage(
      name: AppRoutes.VideoViewScreen,
      page: () => VideoViewScreen(),
      binding: VideoViewBinding(),
    ),
  ];
}

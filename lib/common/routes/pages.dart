import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/Onboarding/page_view/screen_page_view/index.dart';
import '../../ui/activities/sport_activities_screen/index.dart';
import '../../ui/followers/followers_remove_screen/index.dart';
import '../../ui/followers/followers_check_screen/index.dart';
import '../../ui/fitness/fitness_women_screen/index.dart';
import '../../ui/activities/activities_screen/index.dart';
import '../../ui/activities/disability_screen/index.dart';
import '../../ui/auth/change_password_screen/index.dart';
import '../../ui/auth/forget_password_screen/index.dart';
import '../../ui/fitness/fitness_men_screen/index.dart';
import '../../ui/health/health_tips_screen/index.dart';
import '../../ui/auth/edit_profial_screen/index.dart';
import '../../ui/settings/settings_screen/index.dart';
import '../../ui/auth/check_email_screen/index.dart';
import '../../ui/group/new_group_screen/index.dart';
import '../../ui/settings/about_screen/index.dart';
import '../../ui/auth/register_screen/index.dart';
import '../../ui/settings/help_screen/index.dart';
import '../../ui/group/groups_screen/index.dart';
import '../../ui/fitness/club_screen/index.dart';
import '../../ui/auth/login_screen/index.dart';
import '../../ui/auth/done_screen/index.dart';
import '../../ui/group/contact/index.dart';
import '../../ui/splash_screen/index.dart';
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
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: Binding(),
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
      binding: Binding(),
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
      page: () => EditProfialScreen(),
      binding: EditProfialBinding(),
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
      name: AppRoutes.ScreenPageView,
      page: () => const ScreenPageView(),
      binding: ScreenPageBinding(),
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
      page: () => const FitnessMenScreen(),
      binding: FitnessMenBinding(),
    ),
    GetPage(
      name: AppRoutes.FitnessWomenScreen,
      page: () => const FitnessWomenScreen(),
      binding: FitnessWomenBinding(),
    ),
    GetPage(
      name: AppRoutes.ClubScreen,
      page: () => const ClubScreen(),
      binding: ClubBinding(),
    ),
  ];
}

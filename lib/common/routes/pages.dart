import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/splach_screen.dart';
import '../../ui/Onboarding/page_view/screen_page_view.dart';
import '../../ui/activities/activities_screen.dart';
import '../../ui/activities/disability_screen.dart';
import '../../ui/activities/sport_activities_screen.dart';
import '../../ui/auth/change_password_screen.dart';
import '../../ui/auth/check_email_screen.dart';
import '../../ui/auth/done_screen.dart';
import '../../ui/auth/edit_profial_screen.dart';
import '../../ui/auth/forget_password_screen.dart';
import '../../ui/auth/login_screen.dart';
import '../../ui/auth/register_Screen.dart';
import '../../ui/fitness/club_screen.dart';
import '../../ui/fitness/fitness_men_screen.dart';
import '../../ui/fitness/fitness_women_screen.dart';
import '../../ui/followers/followers_check_screen.dart';
import '../../ui/followers/followers_remove_screen.dart';
import '../../ui/group/groups_screen.dart';
import '../../ui/group/new_group_screen.dart';
import '../../ui/health/health_tips_screen.dart';
import '../../ui/home/bottom_navigation/Bottom_Navigation.dart';
import '../../ui/settings/about_screen.dart';
import '../../ui/settings/help_screen.dart';
import '../../ui/settings/settings_screen.dart';
import '../../ui/splach_screen.dart';
import 'routes.dart';

class AppPages {
  static const splash = AppRoutes.splash;
  static const APPlication = AppRoutes.BottomNavigationScreen;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplachScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.done,
      page: () => DoneScreen(),
    ),
    GetPage(
      name: AppRoutes.changepassword,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.activitiesSport,
      page: () => const SportActivitiesScreen(),
    ),
    GetPage(
      name: AppRoutes.disability,
      page: () => const DisabilityScreen(),
    ),
    GetPage(
      name: AppRoutes.BottomNavigationScreen,
      page: () => const BottomNavigationScreen(),
    ),
    GetPage(
      name: AppRoutes.ForgetPassword,
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.checkemail,
      page: () => const CheckEmailScreen(),
    ),
    GetPage(
      name: AppRoutes.editProfial,
      page: () => EditProfialScreen(),
    ),
    GetPage(
      name: AppRoutes.Setting,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: AppRoutes.About,
      page: () => const AboutScreen(),
    ),
    GetPage(
      name: AppRoutes.Help,
      page: () => const HelpScreen(),
    ),
    GetPage(
      name: AppRoutes.FollowersRemove,
      page: () => const FollowersRemoveScreen(),
    ),
    GetPage(
      name: AppRoutes.FollowesCheck,
      page: () => const FollowesCheckScreen(),
    ),
    GetPage(
      name: AppRoutes.Splach,
      page: () => const SplachScreen(),
    ),
    GetPage(
      name: AppRoutes.ScreenPageView,
      page: () => const ScreenPageView(),
    ),
    GetPage(
      name: AppRoutes.GroupScreen,
      page: () => const GroupScreen(),
    ),
    GetPage(
      name: AppRoutes.NewGroup,
      page: () => const NewGroupScreen(),
    ),
    GetPage(
      name: AppRoutes.Activities,
      page: () => const ActivitiesScreen(),
    ),
    GetPage(
      name: AppRoutes.HealthTipsScreen,
      page: () => const HealthTipsScreen(),
    ),
    GetPage(
      name: AppRoutes.FitnessMenScreen,
      page: () => const FitnessMenScreen(),
    ),
    GetPage(
      name: AppRoutes.FitnessWomenScreen,
      page: () => const FitnessWomenScreen(),
    ),
    GetPage(
      name: AppRoutes.ClubScreen,
      page: () => const ClubScreen(),
    ),
  ];
}

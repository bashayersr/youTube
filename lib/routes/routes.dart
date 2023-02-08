import 'package:get/get.dart';
import 'package:youtube/App.dart';
import 'package:youtube/logic/controllers/youtube/YoutubeDetailController.dart';
import 'package:youtube/logic/controllers/youtube/youtube_search_controller.dart';
import 'package:youtube/views/components/YoutubeDetail.dart';
import 'package:youtube/views/screens/auth/LoginScreen.dart';
import 'package:youtube/views/screens/auth/setting/EditProfileScreen.dart';
import 'package:youtube/views/screens/auth/setting/Profile.dart';
import 'package:youtube/views/screens/auth/setting/SettingsScreen.dart';
import 'package:youtube/views/screens/youtube/YoutubeSearch.dart';
import 'package:youtube/views/screens/auth/ForgotPasswordScreen.dart';
import 'package:youtube/views/screens/auth/SignupScreen.dart';

import '../logic/bindings/auth_binding.dart';

class AppRoutes {
  static const login = Routes.loginScreen;

  static final routes = [
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotpasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.profileScreen,
        page: () => ProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.editProfileScreen,
        page: () => EditProfileScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.settingsScreen,
        page: () => SettingScreen(),
        binding: AuthBinding()),

    GetPage(
        name: Routes.mainScreen,
        page: () => App()),

    GetPage(name: "/", page: () => App()),
    GetPage(
      name: "/detail/:videoId",
      page: () => YoutubeDetail(),
      binding: BindingsBuilder(
            () => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController()),
      ),
    ),
    GetPage(
      name: "/search",
      page: () => YoutubeSearch(),
      binding: BindingsBuilder(
            () => Get.lazyPut<YoutubeSearchController>(
                () => YoutubeSearchController()),
      ),
    )
  ];
}

class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgotpasswordScreen = '/forgotpasswordScreen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const settingsScreen = '/settingsScreen';
  static const mainScreen='/mainScreen';
}

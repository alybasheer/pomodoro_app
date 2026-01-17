import 'package:get/get.dart';
import 'package:pomodoro/bindings/app_bindings.dart';
import 'package:pomodoro/entry_screen/entry_screen.dart';
import 'package:pomodoro/home_screen/view/home_screen.dart';
import 'package:pomodoro/routes/routes_name.dart';
import 'package:pomodoro/setting_screen/view/setting_screen.dart';
import 'package:pomodoro/splash_screen/splash_screen.dart';

class RoutePaths {
  static List<GetPage> routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: RoutesName.settingScreen,
      page: () => SettingScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: RoutesName.entryScreen,
      page: () => EntryScreen(),
      binding: AppBindings(),
    ),
  ];
}

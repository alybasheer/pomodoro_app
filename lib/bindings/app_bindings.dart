import 'package:get/get.dart';
import 'package:pomodoro/entry_screen/entry_screen.dart';
import 'package:pomodoro/home_screen/controller/home_cntrl.dart';
import 'package:pomodoro/setting_screen/controller/setting_cntrl.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Register EntryCntrl for navigation
    Get.put<EntryCntrl>(EntryCntrl());
    // Register HomeController first - it has no dependencies
    Get.put<HomeController>(HomeController());
    // Then register SettingCntrl - it depends on HomeController
    Get.put<SettingCntrl>(SettingCntrl());
  }
}

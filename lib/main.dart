import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/entry_screen/entry_screen.dart';
import 'package:pomodoro/home_screen/controller/home_cntrl.dart';
import 'package:pomodoro/setting_screen/controller/setting_cntrl.dart';
import 'package:pomodoro/utility/themes/light_theme/light_theme.dart';

void main() {
  Get.put(HomeController());
  Get.put(SettingCntrl());
  Get.put(EntryCntrl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pomodoro Timer',
      themeMode: ThemeMode.system,
      theme: LightTheme.lighttheme,
      home: EntryScreen(),
    );
  }
}

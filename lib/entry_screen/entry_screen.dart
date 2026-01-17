import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/home_screen/controller/home_cntrl.dart';
import 'package:pomodoro/home_screen/view/home_screen.dart';
import 'package:pomodoro/setting_screen/controller/setting_cntrl.dart';
import 'package:pomodoro/setting_screen/view/setting_screen.dart';
import 'package:pomodoro/utility/constants/app_colors.dart';

class EntryScreen extends StatelessWidget {
  EntryScreen({super.key});
  final List<Widget> pages = [HomeScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    EntryCntrl entryCntrl = Get.find<EntryCntrl>();
    SettingCntrl settingCntrl = Get.find<SettingCntrl>();
    HomeController homeCntrl = Get.find<HomeController>();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'POMONDORO',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Icon(
                  Icons.restart_alt_outlined,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          Obx(() => Expanded(child: pages[entryCntrl.selectedIndex.value])),
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              height: 120,

              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                border: Border(
                  top: BorderSide(color: AppColors.primaryColor, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 100),
                    child: Obx(
                      () => IconButton(
                        onPressed: () {
                          entryCntrl.changeIndex(0);
                        },
                        icon: Icon(
                          Icons.home,
                          size: 30,
                          color:
                              entryCntrl.selectedIndex == 0
                                  ? AppColors.primaryColor
                                  : null,
                        ),
                      ),
                    ),
                  ),
                  // settings
                  Obx(
                    () => IconButton(
                      onPressed: () {
                        entryCntrl.changeIndex(1);
                      },
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                        color:
                            entryCntrl.selectedIndex == 1
                                ? AppColors.primaryColor
                                : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //play, pause
          Positioned(
            left: 276,
            bottom: 50,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondaryColor.withOpacity(.6),
                    AppColors.secondaryColor,
                  ],
                ),
              ),
              child: Center(
                child: Obx(
                  () => IconButton(
                    onPressed: () {
                       entryCntrl.selectedIndex == 0
                          ? homeCntrl.playPause()
                          :
                      settingCntrl.start();
                      // print('time is :${settingCntrl.pomodoroValue.value}');
                    },
                    icon: entryCntrl.icon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.60, 0);
    // Left curve

    // Right curve
    path.quadraticBezierTo(
      size.width * 0.78,
      size.height * 1.2,
      size.width * .90,
      0,
    );
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class EntryCntrl extends GetxController {
  RxInt selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Icon get icon {
    if (selectedIndex.value == 0) {
      return Icon(
        Icons.play_arrow_rounded,
        size: 80,
        color: AppColors.primaryColor,
      );
    } else {
      return Icon(Icons.check_rounded, size: 80, color: AppColors.primaryColor);
    }
  }
}

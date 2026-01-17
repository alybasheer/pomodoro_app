import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/home_screen/controller/home_cntrl.dart';
import 'package:pomodoro/setting_screen/controller/setting_cntrl.dart';
import 'package:pomodoro/utility/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final HomeController homeCntrl = Get.find<HomeController>();
  final SettingCntrl settingCntrl = Get.find<SettingCntrl>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    homeCntrl.tabController = tabController;

    // Listen to tab changes
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        homeCntrl.currentTabIndex.value = tabController.index;
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int pomodoroDuration = settingCntrl.pomodoroValue.value;
    int shortBreakDuration = settingCntrl.shortBreakValue.value;
    int longBreakDuration = settingCntrl.longBreakValue.value;

    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Obx(
                  () => countdownTimer(
                    _getDurationByTab(
                      homeCntrl.currentTabIndex.value,
                      pomodoroDuration,
                      shortBreakDuration,
                      longBreakDuration,
                    ),
                    homeCntrl.controller,
                    context,
                  ),
                ),
              ),
              Spacer(),
              tabItems(context),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  int _getDurationByTab(
    int tabIndex,
    int pomodoroDuration,
    int shortBreakDuration,
    int longBreakDuration,
  ) {
    switch (tabIndex) {
      case 0:
        return pomodoroDuration;
      case 1:
        return shortBreakDuration;
      case 2:
        return longBreakDuration;
      default:
        return pomodoroDuration;
    }
  }

  Stack countdownTimer(
    int duration,
    CountDownController controller,
    BuildContext context,
  ) {
    return Stack(
      children: [
        Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CircularCountDownTimer(
              autoStart: false,
              width: 200,
              height: 200,
              duration: duration,
              fillColor: AppColors.secondaryColor,
              ringColor: AppColors.primaryColor,
              strokeCap: StrokeCap.round,
              controller: controller,
              strokeWidth: 14.0,
              isReverse: true,
              isReverseAnimation: true,
              textStyle: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.secondaryColor),
              onComplete: () async {
                settingCntrl.playSound();
                await settingCntrl.delay();
                settingCntrl.getTime(duration);

                // Move to next tab automatically
                int nextTab = (homeCntrl.currentTabIndex.value + 1) % 3;
                homeCntrl.changeTab(nextTab);

                // Reset timer for next cycle
                homeCntrl.controller.reset();
              },
            ),
          ),
        ),
      ],
    );
  }

  TabBar tabItems(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.greyColor,
      labelStyle: Theme.of(context).textTheme.bodyMedium,
      unselectedLabelStyle: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontSize: 15),
      indicatorColor: AppColors.primaryColor,
      indicatorWeight: 3,
      onTap: (index) {
        homeCntrl.currentTabIndex.value = index;
        homeCntrl.controller.reset();
      },
      tabs: const [Text('Pomodoro'), Text('Short Break'), Text('Long Break')],
    );
  }
}




//Tab ek list du isy 

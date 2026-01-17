import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isStarted = true.obs;
  RxInt currentTabIndex = 0.obs; // Track current tab
  CountDownController controller = CountDownController();
  late TabController tabController;

  void changeTab(int index) {
    currentTabIndex.value = index;
    if (tabController.hasListeners) {
      tabController.animateTo(index);
    }
  }

  void playPause() {
    isStarted.value = !isStarted.value;
    if (isStarted.value) {
      controller.start();
    } else {
      controller.pause();
    }
  }
}

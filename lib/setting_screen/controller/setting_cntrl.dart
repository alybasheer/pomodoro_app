import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pomodoro/home_screen/controller/home_cntrl.dart';

class SettingCntrl extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  HomeController homeCntrl = Get.find<HomeController>();
  RxBool isStart = false.obs;
  RxMap<String, int> pomondoroTimes =
      {'5': 5, '10': 600, '25': 1500, '35': 2100, '45': 2700, '60': 3600}.obs;

  RxMap<String, int> shortBreakTimes = {'5': 300, '10': 600}.obs;
  RxMap<String, int> longBreakTimes =
      {
        '15': 900,
        '20': 1200,
        '25': 1500,
        '30': 1800,
        '45': 2700,
        '60': 3600,
      }.obs;
  int count = 1;

  RxInt pomodoroValue = 5.obs;
  RxInt shortBreakValue = 300.obs;
  RxInt longBreakValue = 1200.obs;

  @override
  void onInit() {
    audioPlayer = AudioPlayer();
    audioPlayer.setAsset('assets/sounds/completion_sound.wav');
    super.onInit();
  }

  void start() => homeCntrl.controller.restart(duration: pomodoroValue.value);

  getTime(int duration) {
    if (duration == pomodoroValue.value && count <= 5) {
      count++;
      homeCntrl.controller.restart(duration: shortBreakValue.value);
    } else if (duration == shortBreakValue.value && count <= 5) {
      count++;
      homeCntrl.controller.restart(duration: pomodoroValue.value);
    } else {
      homeCntrl.controller.restart(duration: longBreakValue.value);
    }
  }

  playSound() async {
    await audioPlayer.play();
  }

  delay() async {
    await Future.delayed(Duration(seconds: 3));
  }
}

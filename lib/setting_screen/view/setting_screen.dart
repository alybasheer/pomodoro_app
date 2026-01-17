import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/setting_screen/controller/setting_cntrl.dart';
import 'package:pomodoro/utility/constants/app_colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingCntrl settingCntrl = Get.find<SettingCntrl>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'TIME (MINUTES)',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),
            _buildDropdown(
              'Pomodoro',
              settingCntrl.pomodoroValue.value,
              settingCntrl.pomondoroTimes,
              (value) => setState(() {
                settingCntrl.pomodoroValue.value = value!;
                print('time is :${settingCntrl.pomodoroValue.value}');
              }),
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              'Short Break',
              settingCntrl.shortBreakValue.value,
              settingCntrl.shortBreakTimes,
              (value) =>
                  setState(() => settingCntrl.shortBreakValue.value = value!),
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              'Long Break',
              settingCntrl.longBreakValue.value,
              settingCntrl.longBreakTimes,
              (value) =>
                  setState(() => settingCntrl.longBreakValue.value = value!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String title,
    int value,
    Map<String,int> items,
    ValueChanged<int?> onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title.toLowerCase(),
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor.withOpacity(.40),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<int>(
            value: value,
            underline: const SizedBox(),
            dropdownColor: AppColors.primaryColor,
            iconEnabledColor: Colors.white,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            items:
                items.entries.map((entry) => DropdownMenuItem<int>(value: entry.value,child: Text(entry.key)),).toList(),
                    
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

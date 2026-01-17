import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomodoro/utility/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    void initState() {
      super.initState();
      Timer(const Duration(seconds: 2), () => Get.toNamed('homeScreen'));
    }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Pomondro',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Focused, Consistent and Passionate',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

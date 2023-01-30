import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/views/authentications/login.dart';
import 'package:officedev/views/homescreens/dashboard.dart';
import 'package:officedev/views/onboarding/onboardingone.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkingNavigation();
  }

  checkingNavigation() async {
    try {
      bool? isFirst = await LocalDataSaver.getIsRunAppFirstTime();
      LocalDataSaver.email = (await LocalDataSaver.getEmail())!;
      LocalDataSaver.name = (await LocalDataSaver.getName())!;
      LocalDataSaver.userDoc = (await LocalDataSaver.getUserId())!;

      if (!isFirst!) {
        Timer(const Duration(seconds: 2), (() {
          Get.to(() => DashBoard());
        }));
      }
    } catch (e) {
      LocalDataSaver.setIsRunAppFirstTime();
      Timer(const Duration(seconds: 2), (() {
        Get.to(() => OnBoardingOne());
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffB3D4F4),
          image: DecorationImage(
            image: AssetImage("assets/splash_logo.png"),
          ),
        ),
      ),
    );
  }
}

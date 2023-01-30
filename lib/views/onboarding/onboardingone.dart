import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/utils/size_config.dart';
import 'package:officedev/views/onboarding/onboardingtwo.dart';

import '../../utils/appwidgets.dart';

class OnBoardingOne extends StatefulWidget {
  OnBoardingOne({Key? key}) : super(key: key);

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    final heigt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: heigt * 0.7,
                width: width,
                // height: SizeConfig.,
                // width: SizeConfig.widthMultiplier * 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/onBoard_backgound.png"),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: heigt * 0.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/onBoard_logo.png"),
                        ),
                      ),
                    ),
                    Container(
                      height: heigt * 0.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/onBoard_numbers.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: heigt * 0.3,
            child: Column(
              children: [
                AppWidets.appText(
                  "Hey, time saver",
                  const Color(0xff65A6E7),
                  28,
                  FontWeight.bold,
                  TextAlign.center,
                ),
                SizedBox(
                  height: heigt * 0.015,
                ),
                AppWidets.appText("Welcome to time link", Color(0xff686868), 16,
                    FontWeight.normal, TextAlign.center),
                SizedBox(
                  height: heigt * 0.015,
                ),
                AppWidets.appButton(
                  "Start",
                  width,
                  heigt,
                  () {
                    Get.to(() => OnBoardingTwo());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

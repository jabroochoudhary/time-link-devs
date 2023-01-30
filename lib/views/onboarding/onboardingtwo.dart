import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/views/authentications/login.dart';

import '../../utils/appwidgets.dart';

class OnBoardingTwo extends StatefulWidget {
  OnBoardingTwo({Key? key}) : super(key: key);

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
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
                height: heigt * 0.75,
                width: width,
                // height: SizeConfig.,
                // width: SizeConfig.widthMultiplier * 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/onBoard_backgound.png"),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: heigt * 0.15,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(143, 255, 255, 255),
                  radius: heigt * 0.06,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    child:
                        const Image(image: AssetImage("assets/clock_logo.png")),
                  ),
                ),
              ),
              Positioned(
                left: 25,
                top: heigt * 0.23,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(143, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: width * 0.63,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppWidets.appText("Do you ever wish you had more time",
                      Colors.black, 20, FontWeight.w400, TextAlign.center),
                ),
              ),
              Positioned(
                left: 30,
                top: heigt * 0.4,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(143, 255, 255, 255),
                  radius: heigt * 0.06,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    child: const Image(
                        image: AssetImage("assets/calander_logo.png")),
                  ),
                ),
              ),
              Positioned(
                right: 25,
                top: heigt * 0.48,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(143, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: width * 0.63,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppWidets.appText(
                      "What if we have a solution for you?",
                      Colors.black,
                      20,
                      FontWeight.w400,
                      TextAlign.center),
                ),
              ),
            ],
          ),
          SizedBox(
            height: heigt * 0.25,
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
                  "Continue",
                  width,
                  heigt,
                  () {
                    Get.to(() => LogIn());
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

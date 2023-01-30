import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
import 'package:officedev/views/homescreens/dashboard.dart';

import '../../utils/CustomizedTextFormFiled.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime time = DateTime.now();
    hours = time.hour;
    minutes = time.minute;
    seconds = time.second;
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          DateTime time = DateTime.now();
          hours = time.hour;
          minutes = time.minute;
          seconds = time.second;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: hight,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xffF5FAFF),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppbar(
              text: "Orders",
              isBackIcon: true,
              onPressedIconBack: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashBoard(
                              index: 0,
                            )));
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 34, left: 20, right: 20, bottom: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppWidets.appText("Timer", Colors.black, 35,
                        FontWeight.w500, TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 29),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppWidets.DigitalNumber(
                                    hours.toString().length == 2
                                        ? (hours).toString().substring(
                                            0, hours.toString().length - 1)
                                        : "0"),
                                const SizedBox(
                                  width: 9,
                                ),
                                AppWidets.DigitalNumber(
                                    hours.toString().length > 1
                                        ? (hours).toString().substring(1)
                                        : (hours).toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            AppWidets.appText("HOURS", Colors.black, 14,
                                FontWeight.w400, TextAlign.center),
                          ],
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                AppWidets.DigitalNumber(
                                    minutes.toString().length == 2
                                        ? (minutes).toString().substring(
                                            0, minutes.toString().length - 1)
                                        : "0"),
                                const SizedBox(
                                  width: 9,
                                ),
                                AppWidets.DigitalNumber(
                                    minutes.toString().length > 1
                                        ? (minutes).toString().substring(1)
                                        : (minutes).toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            AppWidets.appText("MINUTES", Colors.black, 14,
                                FontWeight.w400, TextAlign.center),
                          ],
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                AppWidets.DigitalNumber(
                                    seconds.toString().length == 2
                                        ? (seconds).toString().substring(
                                            0, seconds.toString().length - 1)
                                        : "0"),
                                const SizedBox(
                                  width: 9,
                                ),
                                AppWidets.DigitalNumber(
                                    seconds.toString().length > 1
                                        ? (seconds).toString().substring(1)
                                        : (seconds).toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            AppWidets.appText("SECONDS", Colors.black, 14,
                                FontWeight.w400, TextAlign.center),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.red,
                  width: width * 0.4,
                  child: AppWidets.appButton(
                      "30 minute left", width, hight, () {}),
                ),
                Container(
                  // color: Colors.red,
                  width: width * 0.4,
                  child: AppWidets.appButton(
                      "15 minute left", width, hight, () {}),
                ),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // color: Colors.red,
                  width: width * 0.4,
                  child:
                      AppWidets.appButton("5 minute left", width, hight, () {}),
                ),
                Container(
                  // color: Colors.red,
                  width: width * 0.4,
                  child:
                      AppWidets.appButton("2 minute left", width, hight, () {}),
                ),
              ],
            ),
            SizedBox(
              height: hight * 0.07,
            ),
            Center(
              child: AppWidets.appButton("Order Ready", width, hight, () {},
                  clor1: Color(0xff10A104), clor2: Color(0xff4CEB3F)),
            ),
            SizedBox(
              height: hight * 0.06,
            ),
            Center(
                child: AppWidets.appText("Distance form shop", Colors.black, 20,
                    FontWeight.w500, TextAlign.center)),
            SizedBox(
              height: hight * 0.04,
            ),
            Center(
              child: AppWidets.appButton("Order Qr", width, hight, () {}),
            ),
          ],
        ),
      ),
    );
  }
}

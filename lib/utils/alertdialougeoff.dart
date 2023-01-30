import 'dart:async';

import 'package:flutter/material.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:intl/intl.dart';

class AlertDialougeOff extends StatefulWidget {
  
  AlertDialougeOff({ Key? key}) : super(key: key);

  @override
  State<AlertDialougeOff> createState() => _AlertDialougeOffState();
}

class _AlertDialougeOffState extends State<AlertDialougeOff> {
  // DateTime date = DateTime.now().subtract(Duration(hours: 1));

  late Timer _timer;
  int seconds = 0;
  int minutes = 0;
  int hours = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          if (seconds < 0) {
            timer.cancel();
          } else {
            seconds = seconds - 1;
            if (seconds < 0) {
              minutes -= 1;
              seconds = 59;
              if (minutes < 0) {
                hours -= 1;
                minutes = 59;
              }
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      // width: 300,
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: 222,
                decoration: const BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/poff.png"),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xffA150FF),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppWidets.appText(hours.toString(), Colors.black, 24,
                      FontWeight.w400, TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  AppWidets.appText("HOURS", Colors.black, 12, FontWeight.w400,
                      TextAlign.center),
                ],
              ),
              AppWidets.appText(
                  ":", Colors.black, 24, FontWeight.w500, TextAlign.center),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppWidets.appText(minutes.toString(), Colors.black, 24,
                      FontWeight.w400, TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  AppWidets.appText("MINUTES", Colors.black, 12,
                      FontWeight.w400, TextAlign.center),
                ],
              ),
              AppWidets.appText(
                  ":", Colors.black, 24, FontWeight.w500, TextAlign.center),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppWidets.appText(seconds.toString(), Colors.black, 24,
                      FontWeight.w400, TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  AppWidets.appText("SECONDS", Colors.black, 12,
                      FontWeight.w400, TextAlign.center),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          AppWidets.appLongButton("Buy one get one free", width, hight, () {
            Navigator.pop(context);
          }, 25)
        ],
      ),
    );
  }
}

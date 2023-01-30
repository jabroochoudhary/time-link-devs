import 'package:flutter/material.dart';
import 'package:officedev/utils/alertdialougeoff.dart';
import 'package:officedev/views/homescreens/dashboard.dart';

import '../../utils/appwidgets.dart';
import '../../utils/customappbar.dart';

class GraphsAndStatistics extends StatefulWidget {
  GraphsAndStatistics({Key? key}) : super(key: key);

  @override
  State<GraphsAndStatistics> createState() => _GraphsAndStatisticsState();
}

class _GraphsAndStatisticsState extends State<GraphsAndStatistics> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xffF5FAFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppbar(
              text: "Graphs & statistics",
              isBackIcon: true,
              onPressedIconBack: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashBoard(
                              index: 3,
                            )));
              }),
            ),
            // SizedBox(height: 20,),
            Container(
              height: hight - 137,
              width: width,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal: width * 0.045),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: hight * 0.035,
                  ),
                  InkWell(
                    onTap: (() {
                      // print("pressed");
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => AlertDialog(
                      //           contentPadding: EdgeInsets.zero,
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           // title: const Text("Internet"),
                      //           content: AlertDialougeOff(),
                      //         ));
                    }),
                    child: AppWidets.defaultCard(
                        str: "Average order time per day / weekly"),
                  ),
                  SizedBox(
                    height: hight * 0.035,
                  ),
                  AppWidets.defaultCard(
                      str: "Average order completion time per order"),
                  SizedBox(
                    height: hight * 0.035,
                  ),
                  AppWidets.defaultCard(
                      str: "Number of orders on a particular day / week "),
                  SizedBox(
                    height: hight * 0.035,
                  ),
                  AppWidets.defaultCard(str: "Busiest periods "),
                  SizedBox(
                    height: hight * 0.035,
                  ),
                  AppWidets.defaultCard(str: "Order per day / week"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

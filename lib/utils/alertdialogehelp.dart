import 'dart:async';

import 'package:flutter/material.dart';
import 'package:officedev/utils/appwidgets.dart';

import 'alertdialogeqrscan.dart';

class AlertDialougeHelp extends StatefulWidget {
  AlertDialougeHelp({Key? key}) : super(key: key);

  @override
  State<AlertDialougeHelp> createState() => _AlertDialougeHelpState();
}

class _AlertDialougeHelpState extends State<AlertDialougeHelp> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 370,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      // width: 300,
      // color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44, vertical: 18),
            child: AppWidets.appText("Please Enter the Order Number",
                Colors.black, 28, FontWeight.w500, TextAlign.center),
          ),
          SizedBox(
            height: 10,
          ),
          AppWidets.appLongButton("# 124567", width, hight, () {}, 25),
          SizedBox(
            height: 29,
          ),
          AppWidets.appLongButton("Add fun facts", width, hight, () {}, 25),
          SizedBox(
            height: 29,
          ),
          AppWidets.appLongButton(" Generate Qr Code", width, hight, () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // title: const Text("Internet"),
                      content: AlertDialougeQrScan(),
                    ));
          }, 54),
        ],
      ),
    );
  }
}

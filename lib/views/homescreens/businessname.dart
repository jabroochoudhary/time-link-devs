import 'package:flutter/material.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
import 'package:officedev/views/homescreens/dashboard.dart';

import '../../utils/CustomizedTextFormFiled.dart';

class BusinessName extends StatefulWidget {
  BusinessName({Key? key}) : super(key: key);

  @override
  State<BusinessName> createState() => _BusinessNameState();
}

class _BusinessNameState extends State<BusinessName> {
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppbar(
                  text: "Businesses name",
                  isBackIcon: true,
                  onPressedIconBack: (() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashBoard(
                                  index: 1,
                                )));
                  }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  height: hight * 0.4,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/business_name.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/person_pic.png"),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      AppWidets.appText("Madara uchiha", Colors.black, 14,
                          FontWeight.w400, TextAlign.center),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: AppWidets.appText("Business Name", Colors.black, 14,
                      FontWeight.w500, TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 5),
                  child: CustomizedTextFormFiled(
                    text: "Clothes",
                    textSize: 14,
                  ),
                ),
                SizedBox(
                  height: hight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: AppWidets.appText("Address", Colors.black, 14,
                      FontWeight.w500, TextAlign.left),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 5),
                  child: CustomizedTextFormFiled(
                    text: "Address",
                    textSize: 14,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

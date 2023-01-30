import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
// import 'package:officedev/views/homescreens/placeorder/Model/pLace_order_model.dart';
// import 'package:officedev/views/homescreens/placeorder/View/placeordercontroler.dart';
import 'package:officedev/views/homescreens/placeorder/ViewModel/placeordercontroler.dart';
// import 'package:officedev/views/homescreens/placeorder/placeordercontroler.dart';

import '../../../utils/CustomizedTextFormFiled.dart';
import '../../../utils/appwidgets.dart';
import '../../../utils/customappbar.dart';
import 'package:intl/intl.dart';

class PlaceOrder extends StatefulWidget {
  PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final PlaceOrderController _prController = Get.put(PlaceOrderController());
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: customAppbar(
            isBackIcon: true,
            onPressedIconBack: () {
              Navigator.pop(context);
            },
            text: "Place Order",
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
        body: Obx(
          () => _prController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: hight,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Color(0xffF5FAFF),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: hight * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: AppWidets.appText("Order Title", Colors.black,
                            14, FontWeight.w400, TextAlign.left),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 5, right: 5),
                        child: CustomizedTextFormFiled(
                          text: "Title",
                          textSize: 14,
                          cntr: _prController.titleCntr.value,
                        ),
                      ),
                      SizedBox(
                        height: hight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: AppWidets.appText("Last Date & Time",
                            Colors.black, 14, FontWeight.w400, TextAlign.left),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 5, right: 5),
                        child: CustomizedTextFormFiled(
                          onTextFieldClick: (() async {
                            DateTime? date = await showDatePicker(
                              firstDate: DateTime.now().add(Duration(days: 1)),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 60)),
                              initialDate:
                                  DateTime.now().add(Duration(days: 1)),
                              context: context,
                            );
                            TimeOfDay? time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                    hour: DateTime.now().hour,
                                    minute: DateTime.now().minute));
                            date?.add(Duration(
                                hours: time!.hour,
                                minutes: time.minute,
                                seconds: 01));
                            _prController.dateTime =
                                DateFormat('yyyy/MM/dd hh:mm:ss')
                                    .format(date!)
                                    .obs;
                            print("selected date = " +
                                _prController.dateTime.value);

                            _prController.datetimeCntr.value.text =
                                _prController.dateTime.obs.string;
                          }),
                          readOnly: true,
                          text: "Date & Time",
                          cntr: _prController.datetimeCntr.value,
                        ),
                      ),
                      SizedBox(
                        height: hight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: AppWidets.appText(
                          "Budget",
                          Colors.black,
                          14,
                          FontWeight.w400,
                          TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 5, right: 5),
                        child: CustomizedTextFormFiled(
                            isNumber: true,
                            keyboardtype: TextInputType.number,
                            text: "Budget in Rs",
                            textSize: 14,
                            cntr: _prController.budgetCntr.value),
                      ),
                      SizedBox(
                        height: hight * 0.04,
                      ),
                      SizedBox(
                        height: hight * 0.04,
                      ),
                      AppWidets.appLongButton("Place Order", width, hight,
                          () async {
                        _prController.palceOrderNetwok();
                      }, 0),
                      SizedBox(
                        height: hight * 0.04,
                      ),
                      SizedBox(
                        height: hight * 0.03,
                      ),
                    ],
                  ),
                ),
        ));
  }
}

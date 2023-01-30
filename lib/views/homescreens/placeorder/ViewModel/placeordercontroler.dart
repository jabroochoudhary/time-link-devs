import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/views/homescreens/placeorder/Model/pLace_order_model.dart';
import 'package:officedev/views/homescreens/placeorder/Servces/placeordernetworkservice.dart';

import '../../../../services/inAppServices/LocalDataSaver.dart';

class PlaceOrderController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    // PlaceOrderNetworkService.getOrders();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  RxString dateTime = "".obs;
  Rx<TextEditingController> titleCntr = TextEditingController().obs;
  Rx<TextEditingController> datetimeCntr = TextEditingController().obs;
  Rx<TextEditingController> budgetCntr = TextEditingController().obs;
  Rx<TextEditingController> ageCntr = TextEditingController().obs;

  void palceOrderNetwok() async {
    print("calling");
    if (datetimeCntr.value.text.isNotEmpty &&
        titleCntr.value.text.isNotEmpty &&
        budgetCntr.value.text.isNotEmpty) {
      isLoading.obs.value = true.obs;
      final orderData = PlaceOrderModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        lastdate: dateTime.value,
        title: titleCntr.value.text,
        userid: LocalDataSaver.userDoc,
        budget: int.parse(budgetCntr.value.text),
      );
      final isSucess = await PlaceOrderNetworkService.placeOrder(orderData);
      if (isSucess) {
        isLoading = false.obs;
        print("Order isplaced");
        Get.back();
      }
    } else {}
  }

   void deleteOrder(String docId) async {
    if (await PlaceOrderNetworkService.deleteOrders(docId)) {
      print("Order deleted");
    }
  }
}

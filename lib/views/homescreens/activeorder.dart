import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/services/networkServices/FirebaseHelperDoc.dart';
import 'package:officedev/utils/alertdialougeoff.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
// import 'package:officedev/views/chat/chatscreen.dart';
// import 'package:officedev/views/homescreens/placeorder/Model/pLace_order_model.dart';
import 'package:officedev/views/homescreens/placeorder/place_order.dart';

import 'placeorder/ViewModel/placeordercontroler.dart';

// import '../../utils/bottumbar.dart';

class ActiveOrders extends StatefulWidget {
  ActiveOrders({Key? key}) : super(key: key);

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  final PlaceOrderController _prController = Get.put(PlaceOrderController());
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            customAppbar(
              text: "Active Order",
              isBackIcon: true,
              icon: Icons.sort,
              isSufixIcon: true,
              onPressedIconAdd: (() => Get.to(() => PlaceOrder())),
            ),
            Container(
              height: hight - 137,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.045),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirebaseHelperDoc.OrderCollectionName)
                      .where("userid", isEqualTo: LocalDataSaver.userDoc)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                      return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final res = snapshot.data!.docs[index];
                            // final res = PlaceOrderModel.fromJson(snapshot
                            //     .data!.docs[index] as Map<String, dynamic>);

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Dismissible(
                                onDismissed: ((direction) {
                                  _prController.deleteOrder(res["id"]);
                                }),
                                background: const Icon(
                                  Icons.delete,
                                  size: 35,
                                  color: Colors.red,
                                ),
                                key: UniqueKey(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(100, 9, 197, 0.45),
                                          spreadRadius: 0.5,
                                          blurRadius: 3,
                                          // offset: Offset(0, 3),
                                          offset: Offset(2.0, 2.0),
                                        ),
                                      ],
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xffC59DF4),
                                          Color(0xffA150FF),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ExpansionTile(
                                    leading: InkWell(
                                      onTap: (() {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            // title: const Text("Internet"),
                                            content: AlertDialougeOff(),
                                          ),
                                        );
                                      }),
                                      child: const Icon(
                                        Icons.timer_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    title: AppWidets.defaultCard(
                                        isCardTextCenter: true,
                                        str: res["title"]),
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.orange,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  color: Colors.orange,
                                                  child: Text(
                                                    "${res['budget']}",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 5,
                                                  horizontal: 10,
                                                ),
                                                child: Text(
                                                  "${res['lastdate']}  |",
                                                  style: const TextStyle(
                                                      color: Colors.orange),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text("No order is placed"),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

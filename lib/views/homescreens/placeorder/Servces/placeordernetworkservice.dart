import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officedev/models/signup_model.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/services/networkServices/FirebaseHelperDoc.dart';
import 'package:officedev/views/homescreens/placeorder/Model/pLace_order_model.dart';
// import 'package:firebase_core/firebase_core.dart';

class PlaceOrderNetworkService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> placeOrder(PlaceOrderModel data) async {
    bool isPlace = false;
    await firestore
        .collection(FirebaseHelperDoc.OrderCollectionName)
        .doc(data.id)
        .set(data.toJson())
        .then((value) {
      isPlace = true;
    }).timeout(Duration(seconds: 10), onTimeout: (() {
      isPlace = false;
    }));

    return isPlace;
  }

  // static Future<List<PlaceOrderModel>> getOrders() async {
  //   List<PlaceOrderModel> orderData = []; // List<PlaceOrderModel>;
  //   await firestore
  //       .collection(FirebaseHelperDoc.OrderCollectionName)
  //       .where("userid", isEqualTo: LocalDataSaver.userDoc)
  //       .get()
  //       .then((QuerySnapshot value) {
  //     print("Data");
  //     for (var doc in value.docs) {
  //       orderData
  //           .add(PlaceOrderModel.fromJson(doc.data() as Map<String, dynamic>));
  //     }
  //   });
  //   return orderData;
  // }

  static Future<bool> deleteOrders(String docId) async {
    bool isdel = false; // List<PlaceOrderModel>;
    await firestore
        .collection(FirebaseHelperDoc.OrderCollectionName)
        .doc(docId)
        .delete()
        .then((value) => isdel = true);

    return isdel;
  }
}

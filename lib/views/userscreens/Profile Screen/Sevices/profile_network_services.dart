import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as refff;
// import 'package:flutter/foundation.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/services/networkServices/FirebaseHelperDoc.dart';

class ProfileNetworkServices {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static Future<bool> UploadUserProfileImage(File image) async {
    String exsistingImageUrl = "";
    String userIMageDoc = "";
    bool isSucess = false;
    await fireStore
        .collection(FirebaseHelperDoc.profileImageCollection)
        .where("email", isEqualTo: LocalDataSaver.email)
        .get()
        .then((QuerySnapshot value) {
      print(value.docs.length.toString() + " Length of docs");
      for (var doc in value.docs) {
        exsistingImageUrl = doc['imageUrl'].toString();
        userIMageDoc = doc.id.toString();
        // print("\n");

        // print(doc["imageUrl"]);
        // print("\n");
        // print(doc.id.toString());
      }

      isSucess = true;
    }).timeout(Duration(seconds: 10), onTimeout: (() {
      isSucess = false;
    }));
    // print(userIMageDoc + "<Doc id after getting image for loop");
    // print(exsistingImageUrl + "<image url after getting image for loop");

    if (exsistingImageUrl.isNotEmpty) {
      await refff.FirebaseStorage.instance
          .refFromURL(exsistingImageUrl)
          .delete();
      String newImageUrl = await uloadImage(image);
      await fireStore
          .collection(FirebaseHelperDoc.profileImageCollection)
          .doc(userIMageDoc)
          .update({
        'imageUrl': newImageUrl,
      }).then((value) {
        isSucess = true;
        print("Image upload and esisting url updated");
      }).timeout(Duration(seconds: 10), onTimeout: (() {
        isSucess = false;
      }));
    } else {
      String newImageUrl = await uloadImage(image);
      await fireStore
          .collection(FirebaseHelperDoc.profileImageCollection)
          .doc(DateTime.now().microsecondsSinceEpoch.toString())
          .set({
        'email': LocalDataSaver.email,
        'imageUrl': newImageUrl,
      }).then((value) {
        print("Image upload and url added");
        isSucess = true;
      }).timeout(Duration(seconds: 10), onTimeout: (() {
        isSucess = false;
      }));
    }
    return isSucess;
  }

  static Future<String> uloadImage(File img) async {
    String ids = DateTime.now().microsecondsSinceEpoch.toString();
    refff.Reference reff = refff.FirebaseStorage.instance
        .ref()
        .child("ProfileImages")
        .child("profile" + ids);
    await reff.putFile(img);

    return await reff.getDownloadURL();
  }

  static Future<String> getImageUrl() async {
    String imageUrl = "";
    await fireStore
        .collection(FirebaseHelperDoc.profileImageCollection)
        .where("email", isEqualTo: LocalDataSaver.email)
        .get()
        .then((QuerySnapshot value) {
      print(value.docs.length.toString() + " Length of docs");
      for (var doc in value.docs) {
        imageUrl = doc['imageUrl'].toString();
      }
    }).timeout(Duration(seconds: 10), onTimeout: (() {
      print("Getting url gonr wrong");
    }));
    return imageUrl;
  }
}

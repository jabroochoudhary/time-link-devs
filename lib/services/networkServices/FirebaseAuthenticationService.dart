import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:officedev/models/LoginModel.dart';
import 'package:officedev/models/signup_model.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/services/networkServices/FirebaseHelperDoc.dart';
import '../../utils/appwidgets.dart';

class Authentication {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<bool> signUpUser(SignUpModel data, BuildContext context) async {
    try {
      var res = await auth
          .createUserWithEmailAndPassword(
              email: data.email!, password: data.pass!)
          .timeout(const Duration(seconds: 10));
      User? user = res.user;

      await user?.sendEmailVerification();
      print(user?.uid.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        AppWidets.topSnakBarEroor(context, mesg: "Account already exsist.");
      } else {
        AppWidets.topSnakBarEroor(context,
            mesg: "Something went wrong in creating your account.");
        // print('The password provided is too weak.');
      }
      return false;
    }
    await firestore
        .collection(FirebaseHelperDoc.UserCollectionName)
        .doc(data.id)
        .set(data.toJson())
        .then((value) {
      print("Account created");
    }).timeout(const Duration(seconds: 10));
    AppWidets.topSnakBarSucess(context, mesg: "Account created sucessfully.");

    return true;
  }

  static Future<bool> loginUser(LogInModel data, BuildContext context) async {
    var userDocData = SignUpModel();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: data.email!, password: data.pass!)
          .timeout(const Duration(seconds: 10));
      // userCredential.user.uid.toString()
      await firestore
          .collection(FirebaseHelperDoc.UserCollectionName)
          .where("email", isEqualTo: data.email)
          // .doc("1669100201460264")
          .get()
          .then((QuerySnapshot value) {
        for (var doc in value.docs) {
          // print(doc.data().toString());
          userDocData =
              SignUpModel.fromJson(doc.data() as Map<String, dynamic>);
          LocalDataSaver.setEmail(userDocData.email!);
          LocalDataSaver.email = userDocData.email!;
          LocalDataSaver.setName(
              "${userDocData.firstname!} ${userDocData.lastname!}");
          LocalDataSaver.name =
              "${userDocData.firstname!} ${userDocData.lastname!}";
          LocalDataSaver.setUserId(userDocData.id!);
          LocalDataSaver.userDoc = userDocData.id!;
        }
        // print("Data => " + data.email!);
      }).timeout(const Duration(seconds: 10));
      // print((userDocData.address).toString() + " add");

      print(("Login Sucess"));
      AppWidets.topSnakBarSucess(context, mesg: "Login sucess");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppWidets.topSnakBarEroor(context, mesg: "Wrong username.");
        return false;
      } else if (e.code == 'wrong-password') {
        AppWidets.topSnakBarEroor(context,
            mesg: "Wrong user name or password.");
        return false;
      } else {
        print("catch => " + e.toString());
        AppWidets.topSnakBarEroor(context, mesg: "Somethong went wrong");
      }
    }

    return false;
  }

  static Future<SignUpModel> getUserData() async {
    var userModel = SignUpModel();
    LocalDataSaver.userDoc = (await LocalDataSaver.getUserId())!;
    print(LocalDataSaver.userDoc + " USer doc id");
    await firestore
        .collection(FirebaseHelperDoc.UserCollectionName)
        .doc(LocalDataSaver.userDoc)
        .get()
        .then((DocumentSnapshot value) {
      userModel = SignUpModel.fromJson(value.data() as Map<String, dynamic>);
      print("\n Data=>" + userModel.firstname!);
      return userModel;
    }).timeout(const Duration(seconds: 10));
    return userModel;
  }

  static Future<bool> updateUserData(SignUpModel data) async {
    bool val = false;
    await firestore
        .collection(FirebaseHelperDoc.UserCollectionName)
        .doc(LocalDataSaver.userDoc)
        .set(data.toJson())
        .whenComplete(() {
      val = true;
      // print(val);
    }).timeout(const Duration(seconds: 10), onTimeout: (() {
      val = false;
    }));
    return val;
  }
}

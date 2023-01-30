import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/models/signup_model.dart';

import '../../../../services/networkServices/FirebaseAuthenticationService.dart';

class EditProfileController extends GetxController {
  var userData = SignUpModel();

  @override
  void onInit() {
    // TODO: implement onInit
    // print("Getx controller onInit");

    fecthUserData();
    super.onInit();
  }



  Rx<String> id = "".obs;
  Rx<TextEditingController> lnameCntr = TextEditingController().obs;
  Rx<TextEditingController> fnameCntr = TextEditingController().obs;
  Rx<TextEditingController> emailCntr = TextEditingController().obs;
  Rx<TextEditingController> passCntr = TextEditingController().obs;
  Rx<TextEditingController> cPassCntr = TextEditingController().obs;
  Rx<TextEditingController> pPnoCntr = TextEditingController().obs;
  Rx<TextEditingController> pnCntr = TextEditingController().obs;
  Rx<TextEditingController> addCntr = TextEditingController().obs;
  Rx<TextEditingController> ageCntr = TextEditingController().obs;

  void fecthUserData() async {
    // print("Calling get user data");
    var userData = await Authentication.getUserData() as SignUpModel;
    // userData = data;
    // print(userData.email.toString() + "<=data");
    if (userData != null) {
      id = userData.id.obs as Rx<String>;
      fnameCntr.value.text = userData.firstname.obs.string;
      emailCntr.value.text = userData.email.obs.string;
      pnCntr.value.text = userData.phonenumber.obs.string;
      addCntr.value.text = userData.address.obs.string;
      ageCntr.value.text = userData.age.obs.string;
      lnameCntr.value.text = userData.lastname.obs.string;
      pPnoCntr.value.text = userData.personalphonenumber.obs.string;
      passCntr.value.text = userData.pass.obs.string;
      // pageLoadingONCall = false.obs;
    }
  }

  void updateUserData(SignUpModel data) async {
    // pageLoadingONCall = true.obs;
    if (await Authentication.updateUserData(data)) {
      print("Edit data done");
    }
    // pageLoadingONCall = false.obs;
  }
}

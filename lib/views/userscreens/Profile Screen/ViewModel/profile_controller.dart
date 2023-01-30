import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:officedev/views/userscreens/Profile%20Screen/Sevices/profile_network_services.dart';
// import 'package:officedev/models/signup_model.dart';

import '../../../../services/networkServices/FirebaseAuthenticationService.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getUserImageUrl();
    super.onInit();
  }

  Rx<String> imageUrl = "".obs;
  void uploadImageToNetwork(File image) async {
    if (await ProfileNetworkServices.UploadUserProfileImage(image)) {
      getUserImageUrl();
    }
  }

  void getUserImageUrl() async {
    String url = await ProfileNetworkServices.getImageUrl();
    imageUrl = url.obs;
  }
}

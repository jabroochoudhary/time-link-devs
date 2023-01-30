import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/utils/alertdialogehelp.dart';
import 'package:officedev/utils/alertdialogeqrscan.dart';
import 'package:officedev/views/homescreens/dashboard.dart';
// import 'package:officedev/views/other/businessarroundyou.dart';
import 'package:officedev/views/userscreens/Edit%20Profile%20Screen/editprofile.dart';
import 'package:officedev/views/userscreens/Profile%20Screen/ViewModel/profile_controller.dart';

// import '../../utils/CustomizedTextFormFiled.dart';
import '../../../utils/appwidgets.dart';
import '../../../utils/customappbar.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final ProfileController _pCntroller = Get.put(ProfileController());
  File? _image;

  final picker = ImagePicker();
  Future pickImage(ImageSource src) async {
    final pick = await picker.pickImage(source: src);
    if (pick != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pick.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
        ],
        // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: Color.fromARGB(255, 77, 51, 94),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
        maxHeight: 300,
        maxWidth: 300,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        cropStyle: CropStyle.rectangle,
      );
      print("here done");
      setState(() {
        if (croppedFile != null) {
          _image = File(pick.path);
          _pCntroller.uploadImageToNetwork(_image!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: hight,
        width: width,
        decoration: const BoxDecoration(
          color: Color(0xffF5FAFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppbar(
              text: "Profile",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 33),
              child: Row(
                children: [
                  InkWell(
                    onTap: (() {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Image Picker'),
                          content: const Text("Select image from"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Gellary"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                              child: const Text("Camera"),
                            ),
                          ],
                        ),
                      );
                    }),
                    child: _pCntroller.imageUrl.obs.value.isEmpty
                        ? _image == null
                            ? const CircleAvatar(
                                radius: 38,
                                backgroundImage:
                                    AssetImage("assets/person_pic.png"),
                              )
                            : CircleAvatar(
                                radius: 38,
                                backgroundImage: FileImage(_image!),
                              )
                        : CircleAvatar(
                            radius: 38,
                            backgroundImage:
                                NetworkImage(_pCntroller.imageUrl.string),
                          ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidets.appText(LocalDataSaver.name, Colors.black, 20,
                          FontWeight.w500, TextAlign.left),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 170,
                        child: AppWidets.appText(
                            "Don’t tell anyone, but I’m obito uchiha.",
                            Colors.black,
                            12,
                            FontWeight.w400,
                            TextAlign.left),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              }),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    AppWidets.appText("Profile", Colors.black, 16,
                        FontWeight.w500, TextAlign.left),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DashBoard(
                              index: 5,
                            ))));
              }),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    const Icon(
                      Icons.hub_outlined,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    AppWidets.appText("Personal linking ", Colors.black, 16,
                        FontWeight.w500, TextAlign.left),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
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
              }),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    const Icon(
                      Icons.qr_code,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    AppWidets.appText("Personal QR code", Colors.black, 16,
                        FontWeight.w500, TextAlign.left),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DashBoard(
                              index: 4,
                            ))));
              }),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.language_outlined,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    AppWidets.appText("Businesses around you", Colors.black, 16,
                        FontWeight.w500, TextAlign.left),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // title: const Text("Internet"),
                          content: AlertDialougeHelp(),
                        ));
              }),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.headset_mic_outlined,
                      size: 26,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    AppWidets.appText("Help", Colors.black, 16, FontWeight.w500,
                        TextAlign.left),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            )
          ],
        ),
      ),
    );
  }
}

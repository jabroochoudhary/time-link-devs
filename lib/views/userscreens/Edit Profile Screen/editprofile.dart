import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/services/inAppServices/LocalDataSaver.dart';
import 'package:officedev/utils/CustomizedTextFormFiled.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
import 'package:officedev/views/userscreens/Edit%20Profile%20Screen/ViewModel/editprofile_controller.dart';

import '../../../models/signup_model.dart';
import '../../../services/networkServices/FirebaseAuthenticationService.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final EditProfileController _sCntroller = Get.put(EditProfileController());
  @override
  void initState() {
    // TODO: implement initState
    _sCntroller.fecthUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // print("Edit profile")
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: customAppbar(
              text: "Profile",
              isBackIcon: true,
              // defaultBackIcon: false,
              onPressedIconBack: (() {
                Navigator.pop(context);
              })),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 29),
                decoration: const BoxDecoration(
                  color: Color(0xffF5FAFF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/person_pic.png"),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          AppWidets.appText("Madara uchiha", Colors.black, 14,
                              FontWeight.w400, TextAlign.center),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppWidets.appText("First name", Colors.black, 14,
                          FontWeight.w500, TextAlign.left),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: CustomizedTextFormFiled(
                        text: "Name",
                        textSize: 14,
                        cntr: _sCntroller.fnameCntr.value,
                      ),
                    ),
                    SizedBox(
                      height: hight * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppWidets.appText("Email", Colors.black, 14,
                          FontWeight.w500, TextAlign.left),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: CustomizedTextFormFiled(
                        readOnly: true,
                        text: "Email",
                        textSize: 14,
                        cntr: _sCntroller.emailCntr.value,
                      ),
                    ),
                    SizedBox(
                      height: hight * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppWidets.appText("Phone number", Colors.black, 14,
                          FontWeight.w500, TextAlign.left),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: CustomizedTextFormFiled(
                        text: "Phone number",
                        textSize: 14,
                        cntr: _sCntroller.pnCntr.value,
                      ),
                    ),
                    SizedBox(
                      height: hight * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppWidets.appText("Age", Colors.black, 14,
                          FontWeight.w500, TextAlign.left),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: CustomizedTextFormFiled(
                        text: "Age",
                        textSize: 14,
                        isNumber: true,
                        cntr: _sCntroller.ageCntr.value,
                      ),
                    ),
                    SizedBox(
                      height: hight * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppWidets.appText("Address", Colors.black, 14,
                          FontWeight.w500, TextAlign.left),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: CustomizedTextFormFiled(
                        text: "Address",
                        textSize: 14,
                        cntr: _sCntroller.addCntr.value,
                      ),
                    ),
                    SizedBox(
                      height: hight * 0.04,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: width * 0.2),
                        child: AppWidets.appButton("Update", width, hight,
                            () async {
                          if (_sCntroller.fnameCntr.value.text.isEmpty ||
                              _sCntroller.addCntr.value.text.isEmpty ||
                              _sCntroller.ageCntr.value.text.isEmpty ||
                              _sCntroller.pnCntr.value.text.isEmpty ||
                              !_sCntroller.emailCntr.value.text.contains("@") ||
                              _sCntroller.emailCntr.value.text.length < 4) {
                            AppWidets.topSnakBarInfo(context,
                                mesg:
                                    "Please fill all fields with valid text.");
                          } else {
                            // print("Model hit");
                            final signUpDataObj = SignUpModel(
                                id: _sCntroller.id.value,
                                address: _sCntroller.addCntr.value.text,
                                age: int.parse(_sCntroller.ageCntr.value.text),
                                email: _sCntroller.emailCntr.value.text,
                                firstname: _sCntroller.fnameCntr.value.text,
                                lastname: _sCntroller.lnameCntr.value.text,
                                pass: _sCntroller.passCntr.value.text,
                                personalphonenumber:
                                    _sCntroller.pPnoCntr.value.text,
                                phonenumber: _sCntroller.pnCntr.value.text);
                            final isSucess =
                                await Authentication.updateUserData(
                                    signUpDataObj);
                            print(isSucess.toString() + "<=sucess");
                            if (isSucess) {
                              _sCntroller.addCntr.value.clear();
                              _sCntroller.fnameCntr.value.clear();

                              _sCntroller.emailCntr.value.clear();

                              _sCntroller.pnCntr.value.clear();
                              _sCntroller.ageCntr.value.clear();

                              Get.back();
                            }
                          }
                        })),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

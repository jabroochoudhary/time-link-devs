import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/models/signup_model.dart';
import 'package:officedev/services/networkServices/FirebaseAuthenticationService.dart';
import 'package:officedev/utils/CustomizedTextFormFiled.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
import 'package:officedev/views/authentications/login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fnameCntr = TextEditingController();
  final lnameCntr = TextEditingController();
  final emailCntr = TextEditingController();
  final passCntr = TextEditingController();
  final cPassCntr = TextEditingController();
  final pPnoCntr = TextEditingController();
  final pnCntr = TextEditingController();
  final addCntr = TextEditingController();
  final ageCntr = TextEditingController();
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: customAppbar(isBackIcon: false, text: "Sign Up"),
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: hight,
        width: width,
        decoration: const BoxDecoration(
          color: Color(0xffF5FAFF),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: hight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("First name", Colors.black, 14,
                    FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "First name",
                  textSize: 14,
                  cntr: fnameCntr,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("Last name", Colors.black, 14,
                    FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Last name",
                  textSize: 14,
                  cntr: lnameCntr,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText(
                  "Email",
                  Colors.black,
                  14,
                  FontWeight.w400,
                  TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Email",
                  textSize: 14,
                  cntr: emailCntr,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("Password", Colors.black, 14,
                    FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Password",
                  textSize: 14,
                  isPassword: true,
                  cntr: passCntr,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty || value.length < 6) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');
                  //     return "At least 6 chars.";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("Confirm password", Colors.black, 14,
                    FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Confirm password",
                  textSize: 14,
                  isPassword: true,
                  cntr: cPassCntr,
                  // validation: (value) {
                  //   if (value == null ||
                  //       value.isEmpty ||
                  //       cPassCntr.text != passCntr.text) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "Password not match.";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("Personal phone number", Colors.black,
                    14, FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "e.g +923123456789",
                  textSize: 14,
                  cntr: pPnoCntr,
                  // validation: (value) {
                  //   if (value == null ||
                  //       value.isEmpty ||
                  //       !value.contains("+923") ||
                  //       value.length != 13) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("Phone number", Colors.black, 14,
                    FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Phone number",
                  textSize: 14,
                  cntr: pnCntr,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText("Address", Colors.black, 14,
                    FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Address",
                  textSize: 14,
                  cntr: addCntr,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppWidets.appText(
                    "Age", Colors.black, 14, FontWeight.w400, TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: CustomizedTextFormFiled(
                  text: "Age",
                  textSize: 14,
                  isNumber: true,
                  cntr: ageCntr,
                  keyboardtype: TextInputType.number,
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     AppWidets.topSnakBarEroor(context,
                  //         mesg: 'Please fill all vaild data.');

                  //     return "*";
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                height: hight * 0.04,
              ),
              AppWidets.appLongButton("Sign Up", width, hight, () async {
                if (fnameCntr.text.isEmpty ||
                    lnameCntr.text.isEmpty ||
                    addCntr.text.isEmpty ||
                    ageCntr.text.isEmpty ||
                    pPnoCntr.text.isEmpty ||
                    pnCntr.text.isEmpty ||
                    !emailCntr.text.contains("@") ||
                    emailCntr.text.length < 4) {
                  AppWidets.topSnakBarInfo(context,
                      mesg: "Please fill all fields with valid text.");
                } else if (passCntr.text.length < 6) {
                  AppWidets.topSnakBarInfo(context,
                      mesg: "Password should at least 6 char.");
                } else if (passCntr.text != cPassCntr.text) {
                  AppWidets.topSnakBarInfo(context,
                      mesg: "Password not match.");
                } else {
                  // print("Model hit");
                  final signUpDataObj = SignUpModel(
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                      address: addCntr.text,
                      age: int.parse(ageCntr.text),
                      email: emailCntr.text,
                      firstname: fnameCntr.text,
                      lastname: lnameCntr.text,
                      pass: passCntr.text,
                      personalphonenumber: pPnoCntr.text,
                      phonenumber: pnCntr.text);
                  final isSucess =
                      await Authentication.signUpUser(signUpDataObj, context);
                  if (isSucess) {
                    addCntr.clear();
                    fnameCntr.clear();
                    lnameCntr.clear();
                    emailCntr.clear();
                    pPnoCntr.clear();
                    pnCntr.clear();
                    ageCntr.clear();
                    cPassCntr.clear();
                    passCntr.clear();
                    Get.back();
                  }
                }
              }, 0),
              SizedBox(
                height: hight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppWidets.appText("I already have an Accoount?", Colors.black,
                      15, FontWeight.w500, TextAlign.center),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: AppWidets.appText(
                      " Log In",
                      Colors.black,
                      18,
                      FontWeight.bold,
                      TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

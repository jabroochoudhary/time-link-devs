import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officedev/models/LoginModel.dart';
import 'package:officedev/services/networkServices/FirebaseAuthenticationService.dart';
import 'package:officedev/utils/CustomizedTextFormFiled.dart';
import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/views/authentications/signup.dart';
import 'package:officedev/views/homescreens/activeorder.dart';
import 'package:officedev/views/homescreens/dashboard.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailCntr = TextEditingController();
  final passCntr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 181, 209, 237).withOpacity(0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: hight * 0.1),
                  height: hight * 0.4,
                  width: width * 0.9,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/person_clock.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hight * 0.025,
              ),
              Center(
                child: AppWidets.appText(
                    "Welcome to timelink",
                    const Color(0xff65A6E7),
                    28,
                    FontWeight.w500,
                    TextAlign.center),
              ),
              SizedBox(
                height: hight * 0.025,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, bottom: 5),
                    child: AppWidets.appText("Email Address", Colors.black, 14,
                        FontWeight.w400, TextAlign.start),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: CustomizedTextFormFiled(
                      isPassword: false,
                      text: "example@gmail.com",
                      isNumber: false,
                      textSize: 14,
                      cntr: emailCntr,
                    ),
                  ),
                  SizedBox(
                    height: hight * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45, bottom: 8),
                    child: AppWidets.appText("Password", Colors.black, 14,
                        FontWeight.w400, TextAlign.start),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: CustomizedTextFormFiled(
                      isPassword: true,
                      text: "password",
                      isNumber: true,
                      textSize: 14,
                      cntr: passCntr,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 45, top: 8, right: width * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: AppWidets.appText(
                            "Forgot Password ?",
                            Colors.black,
                            14,
                            FontWeight.w400,
                            TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: hight * 0.02,
                  ),
                  AppWidets.appLongButton("Log in", width, hight, () async {
                    if (emailCntr.text.isEmpty || passCntr.text.isEmpty) {
                      AppWidets.topSnakBarInfo(context,
                          mesg: "Email and password is required.");
                    } else {
                      final loginDataObj = LogInModel(
                          email: emailCntr.text, pass: passCntr.text);
                      // ignore: use_build_context_synchronously
                      if (await Authentication.loginUser(
                          loginDataObj, context)) {
                        Get.to(() => DashBoard());
                      }
                    }
                  }, 25),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: hight * 0.045),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppWidets.appText("Don’t have an Accoount?", Colors.black,
                          15, FontWeight.w500, TextAlign.center),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignUp());
                        },
                        child: AppWidets.appText(
                          " Sign Up",
                          Colors.black,
                          18,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

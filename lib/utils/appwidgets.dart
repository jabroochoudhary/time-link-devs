import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppWidets {
  static appText(String txt, Color? fontColor, double? fontSize,
      FontWeight? fontweight, TextAlign? textAllign) {
    return Text(
      txt,
      textAlign: textAllign,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }

  static appLongButton(
    String txt,
    double width,
    double hight,
    GestureTapCallback onPressed,
    double widthLess,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: width * 0.025 + widthLess),
        height: 45,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(100, 9, 197, 0.45),
              spreadRadius: 1,
              blurRadius: 5,
              // offset: Offset(0, 3),
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
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static appButton(
    String txt,
    double width,
    double hight,
    GestureTapCallback onPressed, {
    final Color clor1 = const Color(0xffC59DF4),
    final Color clor2 = const Color(0xffA150FF),
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width * 0.6,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              clor1,
              clor2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(100, 9, 197, 0.45),
              spreadRadius: 1,
              blurRadius: 5,
              // offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // final bool isCardTextCenter;
  static defaultCard({String str = "", final bool isCardTextCenter = false}) {
    return Container(
        height: 90,
        // width: 309,

        child: isCardTextCenter
            ? Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: AppWidets.appText(str, Colors.white, 20,
                          FontWeight.w500, TextAlign.start),
                    ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: AppWidets.appText(str, Colors.white, 20,
                        FontWeight.w500, TextAlign.center),
                  ),
                ],
              ));
  }

  // static appTextField(
  //   double width,
  // ) {
  //   return Container(
  //     width: width * 0.8,
  //     padding: EdgeInsets.symmetric(horizontal: width * 0.06),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       gradient: const LinearGradient(
  //         colors: [
  //           Color(0xffC59DF4),
  //           Color(0xffA150FF),
  //         ],
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //     ),
  //     child: TextFormField(

  //       style: const TextStyle(
  //         fontSize: 14,
  //         color: Colors.white,
  //         fontWeight: FontWeight.w400,
  //       ),
  //       decoration: const InputDecoration(

  //         hintText: "example@gmail.com",
  //         hintStyle: TextStyle(
  //           color: Colors.white,
  //           fontSize: 14,
  //           fontWeight: FontWeight.w400,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  static DigitalNumber(String str) {
    return Container(
      height: 47,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(144, 94, 11, 188),
          Color.fromARGB(36, 99, 10, 195),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          str,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 35,
            fontFamily: "DigitalNumber",
          ),
        ),
      )),
    );
  }

  static topSnakBarInfo(
    BuildContext context, {
    String? mesg,
  }) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: mesg!,
      ),
    );
  }

  static topSnakBarEroor(
    BuildContext context, {
    String? mesg,
  }) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: mesg!,
      ),
    );
  }

  static topSnakBarSucess(
    BuildContext context, {
    String? mesg,
  }) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: mesg!,
      ),
    );
  }

  static showLoading(BuildContext context) {}
}

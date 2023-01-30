import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:officedev/utils/appwidgets.dart';

// class CustomAppBar extends StatefulWidget {
//   final String title;
//   final bool isbackButton;
//   final IconData icon;
//   final bool isCenter;
//   // final GestureTapCallback onPressed;
//   const CustomAppBar({
//     Key? key,
//     this.title = "Title",
//     this.isbackButton = true,
//     this.icon = Icons.question_mark,
//     this.isCenter = true,
//   }) : super(key: key);

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(15),
//             bottomRight: Radius.circular(15),
//           ),
//           color: Colors.black,
//         ),
//       ),
//       centerTitle: widget.isCenter,
//       automaticallyImplyLeading: widget.isbackButton,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(15),
//           bottomRight: Radius.circular(15),
//         ),
//       ),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.black),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       title: Text(
//         widget.title,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

class customAppbar extends StatefulWidget {
  final String text;
  final bool isBackIcon;
  final bool defaultBackIcon;
  final GestureTapCallback? onPressedIconBack;

  final GestureTapCallback? onPressedIconAdd;
  final IconData icon;
  final bool isChat;
  final bool isSufixIcon;
  final IconData suficIcon;

  customAppbar(
      {Key? key,
      this.text = 'Screen name',
      this.isBackIcon = false,
      this.defaultBackIcon = false,
      this.onPressedIconBack,
      this.isChat = false,
      this.isSufixIcon = false,
      this.suficIcon = Icons.add,
      this.onPressedIconAdd,
      this.icon = Icons.arrow_back_ios_outlined})
      : super(key: key);

  @override
  State<customAppbar> createState() => _customAppbarState();
}

class _customAppbarState extends State<customAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: widget.isSufixIcon
          ? [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: widget.onPressedIconAdd,
                  child: Icon(
                    widget.suficIcon,
                    color: Colors.white,
                  ),
                ),
              ),
            ]
          : [],
      title: widget.isChat
          ? Container(
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red,
                    backgroundImage: AssetImage("assets/person_pic.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidets.appText("Martha Craig", Colors.white, 16,
                          FontWeight.w600, TextAlign.left),
                      AppWidets.appText("tap here for contact info",
                          Colors.white, 12, FontWeight.w400, TextAlign.left),
                    ],
                  )
                ],
              ),
            )
          : Text(
              widget.text,
              // textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
      automaticallyImplyLeading: widget.defaultBackIcon,
      leading: widget.isBackIcon
          ? IconButton(
              onPressed: widget.onPressedIconBack,
              icon: Icon(
                widget.icon,
                color: Colors.white,
              ))
          : const SizedBox(),
      shadowColor: Color(0xffC59DF4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        // padding: EdgeInsets.only(bottom: 11),
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xffC59DF4), Color(0xffA150FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: widget.isChat
                ? const BorderRadius.all(Radius.circular(0))
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(100, 9, 197, 0.45),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
      ),
    );
  }
}

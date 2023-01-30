import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedTextFormFiled extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final bool isPassword;
  final bool isNumber;
  final double textSize;
  final Function(String)? validation;
  final TextEditingController? cntr;
  final TextInputType? keyboardtype;
  final bool readOnly;
  final GestureTapCallback? onTextFieldClick;

  TextEditingController? controller;
  CustomizedTextFormFiled(
      {Key? key,
      this.width = 342,
      this.isPassword = false,
      this.isNumber = false,
      this.text = "  example@gmail.com",
      this.textSize = 14,
      this.height = 45,
      this.validation,
      this.onTextFieldClick,
      this.keyboardtype,
      this.readOnly = false,
      this.cntr})
      : super(key: key);

  @override
  State<CustomizedTextFormFiled> createState() =>
      _CustomizedTextFormFiledState();
}

class _CustomizedTextFormFiledState extends State<CustomizedTextFormFiled> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    print(widget.isPassword == true);
    setState(() {
      isObscure = widget.isPassword == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.045),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xffC59DF4),
              Color(0xffA150FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(100, 9, 197, 0.45),
              spreadRadius: 1,
              blurRadius: 5,
              // offset: Offset(0, 3),
            ),
          ]),
      child: TextFormField(
        onTap: widget.onTextFieldClick,
        readOnly: widget.readOnly,
        validator: widget.validation as String? Function(String?)?,
        obscureText: isObscure,
        cursorColor: Colors.purple.withOpacity(0.2),
        style: GoogleFonts.rubik(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: widget.textSize,
        ),
        controller: widget.cntr,
        keyboardType: widget.keyboardtype,
        decoration: InputDecoration(
          // prefixIcon: Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: AssetImage('assets/search_icon.png'))
          //   ),
          // ),
          // prefixIcon: Icon(Icons.search,color: Color(0xff23AA49)),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffC4C4C4),
                    size: 20,
                  ))
              : SizedBox(),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(67),
          //   borderSide: BorderSide(
          //     color: Colors.white,
          //     width: 1.0,
          //   ),
          // ),
          focusColor: Colors.blue,
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(67),
          //     borderSide: const BorderSide(
          //       width: 1.0,
          //       color: Colors.transparent,
          //     )),

          hintText: widget.text,

          hintStyle: GoogleFonts.dmSans(
              color: const Color(0xffFFFFFF),
              fontSize: widget.textSize,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

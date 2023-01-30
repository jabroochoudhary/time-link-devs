import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:officedev/utils/CustomizedTextFormFiled.dart';
// import 'package:officedev/utils/appwidgets.dart';
import 'package:officedev/utils/customappbar.dart';
import 'package:officedev/views/homescreens/dashboard.dart';

String googleAPiKey = "AIzaSyAaSnH3DCRONvEag0nsn4lBenfJTd_m3ZU";

class BusinessAroundYou extends StatefulWidget {
  BusinessAroundYou({Key? key}) : super(key: key);

  @override
  State<BusinessAroundYou> createState() => _BusinessAroundYouState();
}

class _BusinessAroundYouState extends State<BusinessAroundYou> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: hight,
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(22.5478131, 88.3403691), zoom: 15),
          )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:officedev/views/homescreens/activeorder.dart';
import 'package:officedev/views/homescreens/businessname.dart';
import 'package:officedev/views/homescreens/graphs&statics.dart';
// import 'package:officedev/views/homescreens/home.dart';
import 'package:officedev/views/order/orders.dart';
import 'package:officedev/views/other/businessarroundyou.dart';
import 'package:officedev/views/userscreens/Profile%20Screen/profile.dart';

// import '../../utils/bottumbar.dart';

class DashBoard extends StatefulWidget {
  int index;
  DashBoard({Key? key, this.index = 0}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState(index);
}

class _DashBoardState extends State<DashBoard> {
  _DashBoardState(this._curruntIndex);
  final tabs = [
    ActiveOrders(),
    Orders(),
    BusinessName(),
    UserProfile(),
    BusinessAroundYou(),
    GraphsAndStatistics(),
  ];
  int _curruntIndex;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: tabs[_curruntIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curruntIndex > 3 ? 0 : _curruntIndex,
        elevation: 2,
        backgroundColor: Colors.white,
        // fixedColor: Colors.blue,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: const Color.fromARGB(255, 150, 81, 197),
        unselectedItemColor: const Color(0xff9B9B9B),
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        onTap: (indx) {
          setState(() {
            _curruntIndex = indx;
          });
        },
        selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(
              0xff9B9B9B,
            )),
        unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(
              0xff9B9B9B,
            )),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_outlined),
            label: "Completed Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: "Scan Qr",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

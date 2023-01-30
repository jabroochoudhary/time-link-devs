import 'package:flutter/material.dart';
import 'package:officedev/utils/appwidgets.dart';

class AlertDialougeQrScan extends StatefulWidget {
  AlertDialougeQrScan({Key? key}) : super(key: key);

  @override
  State<AlertDialougeQrScan> createState() => _AlertDialougeQrScanState();
}

class _AlertDialougeQrScanState extends State<AlertDialougeQrScan> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      // width: 300,
      // color: Colors.red,
      child: Column(
        children: [
          const Icon(
            Icons.qr_code_scanner_outlined,
            size: 220,
            color: Color(0xffA65BFD),
          ),
          const SizedBox(
            height: 5,
          ),
          AppWidets.appLongButton("Close", width, hight, () {
            Navigator.pop(context);
          }, 70)
        ],
      ),
    );
  }
}

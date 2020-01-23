import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: rapidPageAppBar2(
        size: 30.0,
        image: leftArrow,
        onTap: () {
          Navigator.pop(context);
        },
        context: context,
        appTitle: "Scan QR Code",
      ),
      body: Container(),
    );
  }
}

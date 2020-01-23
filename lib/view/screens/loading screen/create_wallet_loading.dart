import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class LoadingCreatedWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
      child: Column(
        children: <Widget>[
          Image.asset(
            private,
            height: 150,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Setting up your Wallet...",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
              letterSpacing: 1.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ));
  }
}

import 'package:annuluswallet/view/widget/routes.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/provider/walletProvider.dart';

class TransferWidgetFunction {
  cancelPayment({BuildContext context, DashboardProvider provider}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(
              "Cancel payment?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "By accepting this cancellation you will be returned to the home screen",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "DECLINE",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 5.0,
              ),
              FlatButton(
                child: Text(
                  "ACCEPT",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  gotoDashBoard(context: context, provider: provider);
                },
              )
            ],
          );
        });
  }
}

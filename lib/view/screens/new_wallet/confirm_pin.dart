import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/view/screens/new_wallet/pin_created_successfully.dart';
import 'package:annuluswallet/view/screens/pin_creation_screen/pin_code_view.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';

class ConfirmPinPage extends StatelessWidget {
  final String pin;
  ConfirmPinPage({this.pin});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: newWalletAppBar1(
        context,
        height: 60.0,
        color: darkBlue,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          PinCode(
            backgroundColor: darkBlue,
            correctPin: pin,
            child: Container(
              margin: EdgeInsets.only(left: 14.0, right: 14.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Step 2 of 2",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Text(
                      "Re-enter your 6 digit PIN",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12.0,
                  ),
                ],
              ),
            ),
            obscurePin: false, // to make pin * instead of number
            codeLength: 6,
            onCodeSuccess: (code) {
              print(code);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PinCreatedSuccessfullyPage()),
              );
            },
            onCodeFail: (code) {
              print("code fail");
            },
          ),
          SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: FlatButton(
                child: Text(
                  "FORGOT PIN",
                  style: TextStyle(
                    color: Color(0xFFbababa),
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      )),
    );
  }
}

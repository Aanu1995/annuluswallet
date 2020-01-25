import 'package:annuluswallet/view/components/export_components.dart';
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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: darkBlue,
        leading: BackArrow(),
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
                    padding: EdgeInsets.only(left: 30.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Step 1 of 2",
                      style: theme.primaryTextTheme.title,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Text(
                      "Re-enter your 6 digit PIN",
                      style: theme.textTheme.title.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  EmptySpace(multiple: 6.0),
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

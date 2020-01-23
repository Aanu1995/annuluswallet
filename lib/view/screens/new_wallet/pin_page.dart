import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_pin.dart';
import 'package:annuluswallet/view/screens/pin_creation_screen/pin_code_view.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';

class PinPage extends StatelessWidget {
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
        child: PinCode(
          backgroundColor: darkBlue,
          child: Container(
            margin: EdgeInsets.only(left: 14.0, right: 14.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Step 1 of 2",
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
                    "Create your 6 digit PIN",
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
          obscurePin: true, // to make pin * instead of number
          codeLength: 6,
          onCodeFail: (code) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConfirmPinPage(
                          pin: code,
                        )));
          },
        ),
      ),
    );
  }
}

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_pin.dart';
import 'package:annuluswallet/view/screens/pin_creation_screen/pin_code_view.dart';

class PinPage extends StatelessWidget {
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
        child: PinCode(
          backgroundColor: darkBlue,
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
                EmptySpace(multiple: 4.0),
                Text(
                  "Create your 6 digit PIN",
                  style: theme.textTheme.title.copyWith(
                    color: Colors.white,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                EmptySpace(multiple: 6.0)
              ],
            ),
          ),
          obscurePin: true, // to make pin * instead of number
          codeLength: 6,
          onCodeFail: (code) => Router.goToWidget(
            context: context,
            page: ConfirmPinPage(pin: code),
          ),
        ),
      ),
    );
  }
}

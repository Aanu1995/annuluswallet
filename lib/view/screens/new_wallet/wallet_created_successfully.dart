import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/request_pin._setup.dart';
import 'package:annuluswallet/view/widget/common.dart';

class WalletCreatedSuccessfullyPage extends StatelessWidget {
  final page;
  WalletCreatedSuccessfullyPage({this.page});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Wallet successfully created",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,
                        letterSpacing: 1.0,
                        color: lightGreen,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Image.asset(
                      walletCreated,
                      height: 150,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "You're all set up Einstein!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonFilled(
              text: "LOGIN FOR THE FIRST TIME",
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              height: 60.0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => page ?? RequestPinPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

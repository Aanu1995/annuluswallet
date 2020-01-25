import 'dart:async';
import 'package:annuluswallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/wallet_created_successfully.dart';

class WalletKeyCreationSuccessful extends StatefulWidget {
  final page;
  final text;
  final Color color;
  WalletKeyCreationSuccessful({this.page, this.text, this.color});
  @override
  _WalletKeyCreationSuccessfulState createState() =>
      _WalletKeyCreationSuccessfulState();
}

class _WalletKeyCreationSuccessfulState
    extends State<WalletKeyCreationSuccessful> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  void delay() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(seconds: 2),
      );
      Router.goToReplacementWidget(
          context: context, page: WalletCreatedSuccessfullyPage());
    });
  }

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
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              widget.text ?? "Successfully created private key...",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                letterSpacing: 1.0,
                color: widget.color ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

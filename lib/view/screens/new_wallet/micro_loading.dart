import 'dart:async';

import 'package:flutter/material.dart';

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/screens/main/login_screen.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_intro.dart';
import 'package:annuluswallet/model/images.dart';

class MicroLoading extends StatefulWidget {
  final String text;
  final page;
  MicroLoading({this.text, this.page});
  @override
  _MicroLoadingState createState() => _MicroLoadingState();
}

class _MicroLoadingState extends State<MicroLoading> {
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
        context: context,
        page: LoginScreen(
          page: MnemonicIntroPage(),
        ),
      );
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
              microLoading,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              widget.text ?? "Stowing that for your Govner...",
              style: Theme.of(context).primaryTextTheme.subhead.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.8,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

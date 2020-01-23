import 'dart:async';

import 'package:annuluswallet/view/screens/wallet_decison_page.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/components/version_type.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/custom_appBar.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
        page: WalletDecisionPage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 80),
        child: AppBarLogo(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                loading,
                height: 320,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(right: 16.0),
              alignment: Alignment.topRight,
              child: Text(
                "Starting mobile wallet...",
                style: primaryTextTheme.subhead,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: VersionTypeText(),
    );
  }
}

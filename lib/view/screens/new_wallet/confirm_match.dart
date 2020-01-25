import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class ConfirmMatch extends StatefulWidget {
  final page;
  ConfirmMatch({this.page});
  @override
  _ConfirmMatchState createState() => _ConfirmMatchState();
}

class _ConfirmMatchState extends State<ConfirmMatch> {
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
          context: context, page: WalletKeyCreationSuccessful());
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
              large_match,
              height: 150,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Confirming match...",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                letterSpacing: 1.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

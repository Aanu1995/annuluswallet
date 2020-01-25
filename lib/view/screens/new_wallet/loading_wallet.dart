import 'package:annuluswallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/main/login_screen.dart';

class LoadingWallet extends StatefulWidget {
  final page;
  LoadingWallet({this.page});
  @override
  _LoadingWalletState createState() => _LoadingWalletState();
}

class _LoadingWalletState extends State<LoadingWallet> {
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
      Router.removeWidget(
        context: context,
        page: widget.page ?? LoginScreen(),
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
              connect,
              height: 150,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Connecting to wallet...",
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
    );
  }
}

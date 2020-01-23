import 'dart:async';
import 'package:countdown/countdown.dart';
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
  double width = 0;
  StreamSubscription<Duration> sub;
  int time = 3000;
  String value;

  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() async {
    CountDown cd = CountDown(Duration(milliseconds: time));
    sub = cd.stream.listen(null);
    sub.onData((Duration d) async {
      print(time - d.inMilliseconds);
      setState(() {
        width =
            ((time - d.inMilliseconds) * MediaQuery.of(context).size.width) /
                time;
      });
    });

    sub.onDone(() {
      sub.cancel();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  widget.page ?? WalletCreatedSuccessfullyPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
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
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 10.0,
            width: width,
            color: Color(0xFF56c549),
          ),
        )
      ],
    ));
  }
}

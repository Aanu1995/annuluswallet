import 'dart:async';

import 'package:countdown/countdown.dart';
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
  double width = 0;
  StreamSubscription<Duration> sub;
  int time = 3000;

  @override
  void initState() {
    super.initState();
    timer();
  }

  timer() async {
    CountDown cd = CountDown(Duration(milliseconds: time));
    sub = cd.stream.listen(null);

    sub.onData((Duration d) {
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
              builder: (context) => widget.page ?? LoginScreen()));
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

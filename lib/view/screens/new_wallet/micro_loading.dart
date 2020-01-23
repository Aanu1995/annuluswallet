import 'dart:async';
import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/main/login_screen.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_intro.dart';

class MicroLoading extends StatefulWidget {
  final String text;
  final page;
  MicroLoading({this.text, this.page});
  @override
  _MicroLoadingState createState() => _MicroLoadingState();
}

class _MicroLoadingState extends State<MicroLoading> {
  double width = 0;
  StreamSubscription<Duration> sub;
  int time = 5000;

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
              builder: (context) =>
                  widget.page ??
                  LoginScreen(
                    page: MnemonicIntroPage(),
                  )));
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
                microLoading,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                widget.text ?? "Stowing that for your Govner...",
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

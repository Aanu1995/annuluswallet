import 'dart:async';
import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_intro.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_match.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';
import 'package:annuluswallet/view/screens/restore_wallet/restore_mnemonic_match.dart';
import 'package:annuluswallet/view/widget/routes.dart';

class ConfirmMatch extends StatefulWidget {
  final page;
  final int index;
  final RapidsProvider provider;
  ConfirmMatch({this.page, this.index, this.provider});
  @override
  _ConfirmMatchState createState() => _ConfirmMatchState();
}

class _ConfirmMatchState extends State<ConfirmMatch> {
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

    sub.onDone(() async {
      if (widget.index != null) {
        int start = widget.index + 1;
        if (mnemonicPhrase[start + 0] == widget.provider.getMnemonic[0] &&
            mnemonicPhrase[start + 1] == widget.provider.getMnemonic[1] &&
            mnemonicPhrase[start + 2] == widget.provider.getMnemonic[2] &&
            mnemonicPhrase[start + 3] == widget.provider.getMnemonic[3] &&
            mnemonicPhrase[start + 4] == widget.provider.getMnemonic[4]) {
          widget.provider.setValidateStatus = true;
        } else {
          widget.provider.setValidateStatus = false;
        }
      } else {
        for (int i = 0; i < 23; i++) {
          if (mnemonicPhrase[i + 1] != widget.provider.getMnemonic[i]) {
            widget.provider.setValidateStatus = false;
            break;
          } else {
            widget.provider.setValidateStatus = true;
          }
        }
      }
      widget.provider.setMnemonicEmpty = true;
      sub.cancel();
      if (widget.provider.isValidate) {
        if (widget.page != null) {
          pushReplacement(
              context: context,
              page: widget.page ?? WalletKeyCreationSuccessful());
        } else {
          pushReplacement(
              context: context,
              page: widget.page ?? WalletKeyCreationSuccessful());
        }
      } else {
        if (widget.page != null) {
          pushReplacement(context: context, page: RestoreMnemonicMatchPage());
        } else {
          pushReplacement(context: context, page: MnemonicMatchPage());
        }
      }
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

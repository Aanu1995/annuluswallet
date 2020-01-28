import 'package:annuluswallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/transfer/function_widget.dart';
import 'package:annuluswallet/view/screens/transfer/payment_complete.dart';
import 'package:annuluswallet/view/widget/common.dart';

class TransferConfirmPayment extends StatelessWidget {
  final Wallet fromWallet;
  final Wallet toWallet;
  String amount = "";
  TransferConfirmPayment({this.fromWallet, this.toWallet, this.amount});

  final Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(top: 16.0),
          child: InkWell(
            child: Image.asset(
              leftArrow,
              color: Theme.of(context).iconTheme.color,
              height: 30.0,
              width: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 16.0),
          child: Text(
            "CONFIRM PAYMENT",
            style: TextStyle(color: Colors.black, letterSpacing: 0.5),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  transfer,
                  height: 40.0,
                  width: 40.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                fromWallet.walletType.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: infoColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.0),
                    border:
                        Border.all(color: Theme.of(context).iconTheme.color)),
                child: Text(
                  fromWallet.id + "?",
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 2.0,
                    color: color,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "SENDING",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                amount + " RPD",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "To " + toWallet.walletType.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: infoColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.0),
                    border:
                        Border.all(color: Theme.of(context).iconTheme.color)),
                child: Text(
                  toWallet.id + "?",
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 2.0,
                    color: color,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Network Fee -1.00 RPD",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Ensure you are sending to RPD Address",
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.0,
                  color: color,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              ButtonFilled(
                text: "CONFIRM PAYMENT",
                height: 50.0,
                margin: EdgeInsets.all(0.0),
                onTap: () => Router.goToWidget(
                  context: context,
                  page: WalletKeyCreationSuccessful(
                    color: Theme.of(context).iconTheme.color,
                    page: PaymentComplete(
                      isSend: false,
                    ),
                    text: "Loading Send Payment...",
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonNotFilled(
                text: "CANCEL",
                fontSize: 17.0,
                height: 50.0,
                margin: EdgeInsets.all(0.0),
                onTap: () {
                  TransferWidgetFunction()
                      .cancelPayment(context: context, provider: provider);
                },
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

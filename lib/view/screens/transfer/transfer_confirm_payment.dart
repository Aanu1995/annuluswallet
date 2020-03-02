import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';
import 'package:annuluswallet/view/screens/transfer/function_widget.dart';
import 'package:annuluswallet/view/screens/transfer/payment_complete.dart';

class TransferConfirmPayment extends StatelessWidget {
  final Wallet fromWallet;
  final Wallet toWallet;
  final String amount;
  const TransferConfirmPayment({
    this.fromWallet,
    this.toWallet,
    this.amount = "",
  });

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
          child: InkWell(
            child: Image.asset(
              leftArrow,
              color: Theme.of(context).iconTheme.color,
              height: 25.0,
              width: 25.0,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "CONFIRM PAYMENT",
          style: TextStyle(color: Colors.black, letterSpacing: 0.5),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                transfer,
                height: 35.0,
                width: 35.0,
              ),
              EmptySpace(multiple: 4.0),
              Text(
                fromWallet.walletType.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              EmptySpace(multiple: 2.0),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: infoColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.0),
                    border:
                        Border.all(color: Theme.of(context).iconTheme.color)),
                child: Text(
                  fromWallet.id + "?",
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 2.0,
                    color: color,
                  ),
                ),
              ),
              EmptySpace(multiple: 2.0),
              Text(
                "SENDING",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              EmptySpace(multiple: 2.0),
              Text(
                amount + " RPD",
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              EmptySpace(multiple: 3.0),
              Text(
                "To " + toWallet.walletType.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              EmptySpace(multiple: 2.0),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: infoColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5.0),
                    border:
                        Border.all(color: Theme.of(context).iconTheme.color)),
                child: Text(
                  toWallet.id + "?",
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 2.0,
                    color: color,
                  ),
                ),
              ),
              EmptySpace(multiple: 6.0),
              Text(
                "Network Fee -1.00 RPD",
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 2.0,
                  color: color,
                ),
              ),
              EmptySpace(),
              Text(
                "Ensure you are sending to RPD Address",
                style: TextStyle(
                  fontSize: 13.0,
                  letterSpacing: 1.0,
                  color: color,
                ),
              ),
              EmptySpace(multiple: 4.0),
              CustomButton(
                text: "CONFIRM PAYMENT",
                onPressed: () => Router.goToWidget(
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
              EmptySpace(multiple: 2.0),
              CustomOutlineButton(
                text: "CANCEL",
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  TransferWidgetFunction()
                      .cancelPayment(context: context, provider: provider);
                },
              ),
              EmptySpace(multiple: 2.0),
            ],
          ),
        ),
      ),
    );
  }
}

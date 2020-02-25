import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/get_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:annuluswallet/view/screens/receive/request_payment.dart';

class ReceivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Receive",
          subtitle: "To Own Address",
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
        child: SingleChildScrollView(
          child: WalletItem(),
        ),
      ),
    );
  }
}

class WalletItem extends StatelessWidget {
  final List<Wallet> list = [
    Wallet("Mobile Wallet", 71000000.00, "Rw5k8966hdtheu68389376eyuy3"),
    Wallet("Trading Wallet", 100980.56, "Rw5k8966hdtheu68389376eyuy3"),
    Wallet("Jason's Rains Wallet", 1115.00, "Rw5k8966hdtheu68389376eyuy3"),
    Wallet("Tour De Crypto", 12000.00, "Rw5k8966hdtheu68389376eyuy3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          "TO ADDRESS",
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 2.0,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        for (int i = 0; i < list.length; i++)
          GetWallet(
            wallet: list[i],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestPaymentPage(
                    wallet: list[i],
                  ),
                ),
              );
            },
          )
      ],
    );
  }
}

class Wallet {
  String walletType;
  double amount;
  String id;
  String formattedAmount;

  Wallet(this.walletType, this.amount, this.id) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: amount);
    this.formattedAmount = fmf.output.nonSymbol;
  }
}

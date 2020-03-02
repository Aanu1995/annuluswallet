import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/get_wallet.dart';
import 'package:annuluswallet/view/components/selected_wallet.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/view/screens/transfer/from_to_address.dart';

class TransferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Transfer",
          subtitle: "To Own Address",
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: SingleChildScrollView(
          child: FromWallet(),
        ),
      ),
    );
  }
}

final List<Wallet> list = [
  Wallet("Mobile Wallet", 71000000.00, "Rw5k8966hdtheu68389376eyuy3"),
  Wallet("Trading Wallet", 100980.56, "Rw5k8966hdtheu68389376eyuy3"),
  Wallet("Jason's Rains Wallet", 1115.00, "Rw5k8966hdtheu68389376eyuy3"),
  Wallet("Tour De Crypto", 12000.00, "Rw5k8966hdtheu68389376eyuy3"),
];

class FromWallet extends StatelessWidget {
  final Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          "FROM ADDRESS",
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 2.0,
            color: color,
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
                  builder: (context) => ToWallet(wallet: list[i]),
                ),
              );
            },
          )
      ],
    );
  }
}

class ToWallet extends StatelessWidget {
  final Wallet wallet;
  ToWallet({this.wallet});

  final Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Transfer",
          subtitle: "To Own Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeadText(text: "FROM ADDRESS"),
            SelectedWallet(
              wallet: wallet,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            HeadText(text: "TO ADDRESS"),
            for (int i = 0; i < list.length; i++)
              if (list[i].walletType != wallet.walletType)
                GetWallet(
                  wallet: list[i],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FromWalletToSendWallet(
                          fromWallet: wallet,
                          toWallet: list[i],
                        ),
                      ),
                    );
                  },
                ),
            EmptySpace(multiple: 2.0),
          ],
        ),
      ),
    );
  }
}

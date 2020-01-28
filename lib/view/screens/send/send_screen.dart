import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/send/send_wallet.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/get_wallet.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';

class SendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RapidAppBarPage(
          preContext: context,
          appTitle: "Send",
          address: "To External Address"),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
        child: SingleChildScrollView(
          child: FromWallet(),
        ),
      ),
    );
  }
}

class FromWallet extends StatelessWidget {
  final Color color = Colors.black;
  static String walletID = "";

  @override
  Widget build(BuildContext context) {
    WalletDetailProvider provider = Provider.of<WalletDetailProvider>(context);
    walletID = provider.getWalletId;
    final List<Wallet> list = [
      Wallet("Mobile Wallet", 71000000.00, "Rwfvdvvtyfvedyuyuedyueyydfvyedyfv"),
      Wallet("Trading Wallet", 100980.56, "Rwfvdvvtyfvedyuyuedyueyydfvyedyfvr"),
      Wallet(
          "Jason's Rains Wallet", 1115.00, "Rwfvdvvtyfvedyuyuedyueyydfvyedyfv"),
      Wallet("Tour De Crypto", 12000.00, "Rwfvdvvtyfvedyuyuedyueyydfvyedyfv"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          "FROM ADDRESS",
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 2.0,
            color: color,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        for (int i = 0; i < list.length; i++)
          GetWallet(
            wallet: list[i],
            onTap: () => Router.goToWidget(
              context: context,
              page: WalletKeyCreationSuccessful(
                color: Theme.of(context).iconTheme.color,
                page: SendWallet(
                  wallet: list[i],
                ),
                text: "Loading Send Payment...",
              ),
            ),
          )
      ],
    );
  }
}

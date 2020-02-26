import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/send/send_wallet.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';

class SendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Send",
          subtitle: "To External Address",
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

class FromWallet extends StatelessWidget {
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
        HeadText(),
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

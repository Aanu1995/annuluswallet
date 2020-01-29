import 'package:flutter/material.dart';

import 'package:annuluswallet/model/small_wallet_model.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:annuluswallet/view/components/header.dart';
import 'package:annuluswallet/view/components/recent_transaction_container.dart';
import 'package:annuluswallet/view/components/small_wallet_card.dart';
import 'package:annuluswallet/view/widget/wallet_card.dart';

class DashboardMainScreen extends StatelessWidget {
  final List<SmallWalletCardModel> smallCard = [
    SmallWalletCardModel(
      color: Color(0xFF184f30),
      walletType: "Trading Wallet",
      balance: "100,981",
      currentValue: "4,500",
    ),
    SmallWalletCardModel(
      color: Color(0xFF28aa60),
      walletType: "Jason's Rains",
      currentValue: "1,115",
      balance: "0.7",
    ),
    SmallWalletCardModel(
      color: Color(0xFF06c1c7),
      walletType: "Tour De Crypto",
      currentValue: "12,000",
      balance: "10",
    ),
  ];

  final double _smallCardSpacing = 75.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(
            amount: "\$245.00",
            bitCoinValue: "B1.505398",
            dollarValue: "\$47.76k",
          ),
          const EmptySpace(multiple: 2.5),
          WalletCard(
            gradientColor: [
              Color(0xFF07bfd1),
              Color(0xFF04c3b9),
              Color(0xFF28aa60)
            ],
            walletType: "Mobile Wallet",
            amount1: "71.00M",
            amount2: "60M",
            date: "01 FEB 2019",
            amountUSD: "\$4,500",
            id: "Rgevdh ********* hsgdh",
            amountBTC: "0.523",
          ),
          const EmptySpace(multiple: 1.5),
          Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  for (int i = 0; i < smallCard.length; i++)
                    Container(
                      margin: EdgeInsets.only(top: _smallCardSpacing * i),
                      child: SmallWalletCard(
                        color: smallCard[i].color,
                        value1: smallCard[i].currentValue,
                        value2: smallCard[i].balance,
                        walletType: smallCard[i].walletType,
                      ),
                    )
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(top: _smallCardSpacing * smallCard.length),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 20.0,
                      ),
                      child: Text(
                        "Recent transactions",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const EmptySpace(multiple: 2.5),
                    ...[
                      RecentContainer(
                        walletType: "Mobile Wallet",
                        icon: Icons.card_giftcard,
                        date: "01 FEB 2019",
                        amount: "+1.04M",
                        time: "11:30 AM",
                        isDeposit: true,
                      ),
                      RecentContainer(
                        walletType: "Reskii............roy6yh",
                        date: "08 AUG 2019",
                        amount: "-343,452",
                        time: "01:30 PM",
                        isDeposit: false,
                        icon: Icons.card_giftcard,
                      ),
                      RecentContainer(
                        walletType: "Mobile Wallet",
                        icon: Icons.card_giftcard,
                        date: "10 JUNE 2019",
                        amount: "+343,452",
                        time: "11:45 AM",
                        isDeposit: true,
                      ),
                    ],
                    Container(
                      height: 40.0,
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 30.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.iconTheme.color),
                      ),
                      child: Center(
                        child: Text(
                          "VIEW ALL",
                          style: theme.primaryTextTheme.subtitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

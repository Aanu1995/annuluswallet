import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/widget/header.dart';
import 'package:annuluswallet/view/widget/recent_transaction_container.dart';
import 'package:annuluswallet/view/widget/wallet_card.dart';

class DashboardMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 20.0,
          ),
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
          SizedBox(
            height: 10.0,
          ),
          Stack(
            children: <Widget>[
              SmallWalletContainer(
                  color: Color(0xFF184f30),
                  walletType: "Trading Wallet",
                  value1: "100,981",
                  value2: "4,500"),
              Container(
                margin: EdgeInsets.only(top: 85.0),
                child: SmallWalletContainer(
                    color: Color(0xFF28aa60),
                    walletType: "Jason's Rains",
                    value1: "1,115",
                    value2: "0.7"),
              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
                child: SmallWalletContainer(
                  color: Color(0xFF06c1c7),
                  walletType: "Tour De Crypto",
                  value1: "12,000",
                  value2: "10",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 255),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.only(left: 10.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        "Recent transactions",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ...[
                      TransactionContainer(
                        walletType: "Mobile Wallet",
                        icon: Icons.card_giftcard,
                        date: "01 FEB 2019",
                        amount: "+1.04M",
                        time: "11:30 AM",
                        isDeposit: true,
                      ),
                      TransactionContainer(
                        walletType: "Reskii............roy6yh",
                        date: "08 AUG 2019",
                        amount: "-343,452",
                        time: "01:30 PM",
                        isDeposit: false,
                        icon: Icons.card_giftcard,
                      ),
                      TransactionContainer(
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
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "VIEW ALL",
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.2,
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.w600,
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

class SmallWalletContainer extends StatelessWidget {
  final Color color;
  final String walletType;
  final String value1;
  final String value2;
  SmallWalletContainer({this.color, this.value1, this.value2, this.walletType});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.only(left: 30.0, right: 20.0, top: 30.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            walletType,
            style: TextStyle(
              fontSize: 16.0,
              letterSpacing: 1.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(currency),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "$value1",
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "\$$value2",
                    style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "USD",
                    style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 1.2,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

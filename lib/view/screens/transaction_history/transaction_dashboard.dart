import 'package:annuluswallet/view/components/header.dart';
import 'package:annuluswallet/view/components/recent_transaction_container.dart';
import 'package:annuluswallet/view/components/small_wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/widget/wallet_card.dart';

class TransactionDashoardPage extends StatefulWidget {
  @override
  _TransactionDashoardPageState createState() =>
      _TransactionDashoardPageState();
}

class _TransactionDashoardPageState extends State<TransactionDashoardPage> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 130.0,
              leading: Container(),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0, right: 30.0),
                      child: Image.asset(
                        bikes,
                      ),
                    )),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                isShow
                    ? Header2(
                        amount: "71,110,003.03342",
                        bitCoinValue: "B1.505398",
                        dollarValue: "\$47.76k",
                      )
                    : Header(
                        amount: "71.11M",
                        bitCoinValue: "B1.505398",
                        dollarValue: "\$47.76k",
                      ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          isShow ? "HIDE" : "SHOW",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        GestureDetector(
                          child: Icon(
                            isShow
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 30.0,
                          ),
                          onTap: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Theme.of(context).iconTheme.color,
                  height: 0.5,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                SizedBox(
                  height: 30.0,
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
                    SmallWalletCard(
                      color: Color(0xFF184f30),
                      walletType: "Trading Wallet",
                      value1: "100,981",
                      value2: "4,500",
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 85.0),
                      child: SmallWalletCard(
                          color: Color(0xFF28aa60),
                          walletType: "Jason's Rains",
                          value1: "1,115",
                          value2: "0.7"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 170.0),
                      child: SmallWalletCard(
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
                            padding: EdgeInsets.only(
                                left: 10.0, top: 20.0, bottom: 10.0),
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
          ),
        ));
  }
}

import 'package:annuluswallet/view/components/header.dart';
import 'package:annuluswallet/view/components/recent_transaction_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/screens/wallet/wallet_details.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/wallet_card.dart';

class WalletScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return WillPopScope(
      onWillPop: () {
        provider.setIndex = 1;
        return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashBoardPage()),
            (Route<dynamic> route) => false);
      },
      child: Scaffold(
          key: _globalKey,
          appBar: rapidPageAppBar2(
              height: 80,
              image: drawer,
              onTap: () {
                _globalKey.currentState.openDrawer();
              },
              context: context,
              appTitle: "Wallets"),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: <Widget>[
                  Header(
                    amount: "321.11M",
                    bitCoinValue: "B5.505398",
                    dollarValue: "\$58.76k",
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
                    height: 20.0,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WalletDetailsPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "OPEN WALLET",
                              style: TextStyle(
                                fontSize: 16.0,
                                letterSpacing: 1.2,
                                color: Theme.of(context).iconTheme.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                  WalletCard(
                    color: Color(0xFF246540),
                    walletType: "Jason's Rain",
                    amount1: "25.54M",
                    amount2: "20.54M",
                    date: "01 FEB 2019",
                    amountUSD: "\$1,500",
                    id: "Rgevdh ********* hsgdh",
                    amountBTC: "0.193",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  WalletCard(
                    color: Color(0xFF28aa60),
                    walletType: "Willy Beamin",
                    amount1: "201.11M",
                    amount2: "51.23M",
                    date: "01 FEB 2019",
                    amountUSD: "\$28,500",
                    id: "Rgevdh ********* hsgdh",
                    amountBTC: "3.723",
                  ),
                  SizedBox(
                    height: 10.0,
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
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
          drawer: DashboardMenu(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: Color(0xFF05a67b),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(rotate),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:annuluswallet/view/screens/manage%20wallet/manage_wallet.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction.dart';
import 'package:annuluswallet/view/screens/wallet/wallet_screen.dart';
import 'package:annuluswallet/view/widget/routes.dart';

class DashboardMenu extends StatelessWidget {
  final String item1 = "Alerts";
  final String item2 = "Dashboard";
  final String item3 = "Wallets";
  final String item4 = "Payments";
  final String item5 = "Transaction History";
  final String item6 = "Address Book";
  final String item7 = "Settings";
  final String item8 = "Help";
  final String item9 = "About";
  final String item10 = "annuluswallet Community";
  final String item11 = "Personalize";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 50.0, left: 16.0),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              height: 48.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme.of(context).iconTheme.color)),
              child: Text(
                "CLOSE",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.30,
              padding: EdgeInsets.only(top: 30.0),
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  Item(
                    title: item1,
                    index: 0,
                    page: DashBoardPage(),
                    icon: alert,
                  ),
                  Item(
                    title: item2,
                    index: 1,
                    page: DashBoardPage(),
                    icon: dashboard,
                  ),
                  Item(
                    title: item3,
                    index: 2,
                    page: WalletScreen(),
                    icon: wallet,
                  ),
                  Item(
                    title: item4,
                    index: 3,
                    icon: payment,
                    page: DashBoardPage(),
                  ),
                  Item(
                    title: item5,
                    index: 4,
                    page: TransactionPage(),
                    icon: history,
                  ),
                  Item(
                    title: item6,
                    index: 5,
                    icon: address,
                    page: DashBoardPage(),
                  ),
                  Item(
                    title: item7,
                    index: 6,
                    icon: settings,
                    page: DashBoardPage(),
                  ),
                  Item(
                    title: item8,
                    index: 7,
                    icon: help,
                    page: DashBoardPage(),
                  ),
                  Item(
                    title: item9,
                    index: 8,
                    icon: about,
                    page: DashBoardPage(),
                  ),
                  Item(
                    title: item10,
                    index: 9,
                    icon: community,
                    page: DashBoardPage(),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Item(
                    title: item11,
                    index: 10,
                    icon: community,
                    page: DashBoardPage(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                "annuluswallet Android Wallet version 1.0.1",
                style: TextStyle(
                  fontSize: 12.0,
                  color: infoColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String title;
  final String icon;
  final page;
  final int index;

  Item({this.title, this.icon, this.page, this.index});

  // This color indicates the item selected in the drawer
  final Color fillcolor = Color(0xFF21693e);

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: provider.selectedItem == index ? fillcolor : Colors.transparent,
        border: Border(
          right: BorderSide(
            color: provider.selectedItem == index
                ? Color(0xFF00b43b)
                : Colors.transparent,
            width: 3.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Image.asset(
          icon,
          height: 30.0,
          width: 30.0,
          color: provider.selectedItem == index
              ? Color(0xFFFFFFFF)
              : icon == community ? Color(0xFF1ab04c) : Color(0xFF626367),
        ),
        title: index != 0
            ? Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  letterSpacing: 0.7,
                ),
              )
            : Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      letterSpacing: 0.7,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    height: 24.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFff5f71),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
        onTap: () {
          Navigator.pop(context);
          provider.setIndex = index;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => page),
              (Route<dynamic> route) => false);
        },
      ),
    );
  }
}

class SpecialMenu extends StatelessWidget {
  final String item1 = "Wallets";
  final String item2 = "Payments";
  final String item3 = "Transaction History";
  final String item4 = "Manage Wallets";
  final String item5 = "Currency";
  final String item6 = "Settings";
  final String item7 = "Help";
  final String item8 = "Debug Console";
  final String item9 = "About";
  final String item10 = "annuluswallet Block Explorer";
  final String item11 = "annuluswallet Community";
  final String item12 = "Legal Info";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 50.0, left: 16.0),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              height: 48.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme.of(context).iconTheme.color)),
              child: Text(
                "CLOSE",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).iconTheme.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.30,
              padding: EdgeInsets.only(top: 30.0),
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  SpecialItem(
                    title: item1,
                    index: 0,
                    page: WalletScreen(),
                    icon: wallet,
                  ),
                  SpecialItem(
                    title: item2,
                    index: 1,
                    icon: payment,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item3,
                    index: 2,
                    page: TransactionPage(),
                    icon: history,
                  ),
                  SpecialItem(
                    title: item4,
                    index: 3,
                    page: ManageWallet(),
                    icon: history,
                  ),
                  SpecialItem(
                    title: item5,
                    index: 4,
                    icon: address,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item6,
                    index: 5,
                    icon: settings,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item7,
                    index: 6,
                    icon: help,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item8,
                    index: 7,
                    icon: help,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item9,
                    index: 8,
                    icon: about,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item10,
                    index: 9,
                    icon: community,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item11,
                    index: 10,
                    icon: community,
                    page: DashBoardPage(),
                  ),
                  SpecialItem(
                    title: item12,
                    index: 11,
                    icon: community,
                    page: DashBoardPage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialItem extends StatelessWidget {
  final String title;
  final String icon;
  final page;
  final int index;

  SpecialItem({this.title, this.icon, this.page, this.index});

  // This color indicates the item selected in the drawer
  final Color fillcolor = Color(0xFF21693e);

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: provider.selectedItem == index ? fillcolor : Colors.transparent,
        border: Border(
          right: BorderSide(
            color: provider.selectedItem == index
                ? Color(0xFF00b43b)
                : Colors.transparent,
            width: 3.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Image.asset(
          icon,
          height: 30.0,
          width: 30.0,
          color: provider.selectedItem == index
              ? Color(0xFFFFFFFF)
              : icon == community ? Color(0xFF1ab04c) : Color(0xFF626367),
        ),
        title: index != 4
            ? Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  letterSpacing: 0.7,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      letterSpacing: 0.7,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "USD",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).iconTheme.color,
                          letterSpacing: 0.7,
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                      )
                    ],
                  )
                ],
              ),
        onTap: () {
          Navigator.pop(context);
          provider.setIndex = index;
          if (index == 3) {
            push(context: context, page: page);
            return;
          }
          pushAndRemoveUntil(context: context, page: page);
        },
      ),
    );
  }
}

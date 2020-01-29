import 'package:annuluswallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:annuluswallet/view/screens/manage%20wallet/manage_wallet.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction.dart';
import 'package:annuluswallet/view/screens/wallet/wallet_screen.dart';
import 'package:annuluswallet/model/drawer_model.dart';

class DashboardMenu extends StatelessWidget {
  final List<DrawerModel> list = [
    DrawerModel(title: "Alerts", icon: alert, page: WalletScreen()),
    DrawerModel(title: "Dashboard", icon: dashboard, page: DashBoardPage()),
    DrawerModel(
      title: "Wallets",
      icon: wallet,
      page: TransactionPage(),
    ),
    DrawerModel(title: "Payments", icon: payment, page: ManageWallet()),
    DrawerModel(
        title: "Transaction History", icon: history, page: DashBoardPage()),
    DrawerModel(title: "Address Book", icon: address, page: DashBoardPage()),
    DrawerModel(title: "Settings", icon: settings, page: DashBoardPage()),
    DrawerModel(title: "Help", icon: help, page: DashBoardPage()),
    DrawerModel(title: "About", icon: about, page: DashBoardPage()),
    DrawerModel(
      title: "Annulus Community",
      icon: community,
      page: DashBoardPage(),
    ),
    DrawerModel(title: "Personalize", icon: community, page: DashBoardPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: OutlineButton(
                  borderSide: BorderSide(color: theme.iconTheme.color),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "CLOSE",
                    style: Theme.of(context).primaryTextTheme.subtitle,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    for (int i = 0; i < list.length; i++)
                      _Item(
                        title: list[i].title,
                        icon: list[i].icon,
                        index: i,
                        page: list[i].page,
                      )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Text(
                  "Annulus Android Wallet version 1.0.1",
                  style: theme.primaryTextTheme.caption,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialMenu extends StatelessWidget {
  final List<DrawerModel> list = [
    DrawerModel(title: "Wallets", icon: wallet, page: WalletScreen()),
    DrawerModel(title: "Payments", icon: payment, page: DashBoardPage()),
    DrawerModel(
      title: "Transaction History",
      icon: history,
      page: TransactionPage(),
    ),
    DrawerModel(title: "Manage Wallets", icon: address, page: ManageWallet()),
    DrawerModel(title: "Currency", icon: currency, page: DashBoardPage()),
    DrawerModel(title: "Settings", icon: settings, page: DashBoardPage()),
    DrawerModel(title: "Help", icon: help, page: DashBoardPage()),
    DrawerModel(title: "Debug Console", icon: help, page: DashBoardPage()),
    DrawerModel(title: "About", icon: about, page: DashBoardPage()),
    DrawerModel(
      title: "Annulus Block Explorer",
      icon: community,
      page: DashBoardPage(),
    ),
    DrawerModel(
      title: "Annulus Community",
      icon: community,
      page: DashBoardPage(),
    ),
    DrawerModel(title: "Legal Info", icon: community, page: DashBoardPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: OutlineButton(
                  borderSide: BorderSide(color: theme.iconTheme.color),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "CLOSE",
                    style: Theme.of(context).primaryTextTheme.subtitle,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    for (int i = 0; i < list.length; i++)
                      _SpecialItem(
                        title: list[i].title,
                        icon: list[i].icon,
                        index: i,
                        page: list[i].page,
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String icon;
  final page;
  final int index;

  _Item({this.title, this.icon, this.page, this.index});

  // This color indicates the item selected in the drawer
  final Color fillcolor = Color(0xFF21693e);

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
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
              : icon == community
                  ? Color(0xFF1ab04c)
                  : Color(
                      0xFF626367,
                    ),
        ),
        title: index != 0
            ? Text(title, style: primaryTextTheme.subtitle)
            : Row(
                children: <Widget>[
                  Text(title, style: primaryTextTheme.subtitle),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        onTap: () {
          Router.goBack(context: context);
          provider.setIndex = index;
          Router.removeWidget(context: context, page: page);
        },
      ),
    );
  }
}

class _SpecialItem extends StatelessWidget {
  final String title;
  final String icon;
  final page;
  final int index;

  _SpecialItem({this.title, this.icon, this.page, this.index});

  // This color indicates the item selected in the drawer
  final Color fillcolor = Color(0xFF21693e);

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
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
            ? Text(title, style: primaryTextTheme.subtitle)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title, style: primaryTextTheme.subtitle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("USD", style: primaryTextTheme.subtitle),
                      EmptySpace(multiple: 1.5),
                      Icon(Icons.arrow_forward_ios, size: 20.0)
                    ],
                  )
                ],
              ),
        onTap: () {
          Router.goBack(context: context);
          provider.setIndex = index;
          if (index == 3) {
            Router.goToWidget(context: context, page: page);
            return;
          }
          Router.removeWidget(context: context, page: page);
        },
      ),
    );
  }
}

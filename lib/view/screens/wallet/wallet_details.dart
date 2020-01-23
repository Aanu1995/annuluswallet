import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_history.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';

class WalletDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletDetailsBottomAppBarProvider>(
      create: (context) => WalletDetailsBottomAppBarProvider(),
      child: WalletDetailsPageState(),
    );
  }
}

class WalletDetailsPageState extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Consumer<WalletDetailsBottomAppBarProvider>(
          builder: (context, provider, child) {
        return Scaffold(
          key: _globalKey,
          appBar: provider.selectedItem == 0
              ? rapidAppBar(context: context, globalKey: _globalKey)
              : rapidPageAppBar2(
                  size: 30.0,
                  image: leftArrow,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  context: context,
                  appTitle: "Mobile Wallet"),
          body: TabBarView(
            children: <Widget>[
              Center(child: Icon(Icons.place)),
              TransactionHistoryPage(),
              Center(child: Icon(Icons.place)),
            ],
          ),
          bottomNavigationBar: WalletDetailsBottomAppBar(),
        );
      }),
    );
  }
}

class WalletDetailsBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WalletDetailsBottomAppBarProvider>(
      builder: (context, provider, child) {
        return BottomAppBar(
          color: Theme.of(context).bottomAppBarTheme.color,
          child: TabBar(
            labelColor: Color(0xFFFFFFFF),
            unselectedLabelColor: Color(0xFF909090),
            indicatorColor: Theme.of(context).bottomAppBarTheme.color,
            onTap: (index) {
              print(index);
              provider.setIndex = index;
            },
            tabs: <Widget>[
              Tab(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      if (provider.selectedItem == 0) Image.asset(bottom_tab),
                      Expanded(
                        child: Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Image.asset(provider.selectedItem == 0
                              ? menu_receive_on
                              : menu_receive_off),
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      if (provider.selectedItem == 1) Image.asset(bottom_tab),
                      Expanded(
                        child: Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Image.asset(provider.selectedItem == 1
                              ? bottom_wallet_on
                              : bottom_wallet_off),
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      if (provider.selectedItem == 2) Image.asset(bottom_tab),
                      Expanded(
                        child: Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Image.asset(provider.selectedItem == 2
                              ? menu_send_on
                              : menu_send_off),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

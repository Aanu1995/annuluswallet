import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_dashboard.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_history.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionBottomAppBarProvider>(
      create: (context) => TransactionBottomAppBarProvider(),
      child: TransactionPageState(),
    );
  }
}

class TransactionPageState extends StatefulWidget {
  @override
  _TransactionPageStateState createState() => _TransactionPageStateState();
}

class _TransactionPageStateState extends State<TransactionPageState>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 1);
    Provider.of<TransactionBottomAppBarProvider>(context, listen: false)
        .setTabController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Consumer<TransactionBottomAppBarProvider>(
          builder: (context, provider, child) {
        return Scaffold(
          key: _globalKey,
          appBar: provider.selectedItem == 0
              ? PreferredSize(
                  preferredSize: Size(double.maxFinite, 80.0),
                  child: DashboardAppBar(globalKey: _globalKey),
                )
              : rapidPageAppBar2(
                  size: 30.0,
                  image: leftArrow,
                  onTap: () {
                    provider.setIndex = 0;
                  },
                  context: context,
                  appTitle: "All Transactions"),
          body: TabBarView(
            controller: provider.tabController,
            children: <Widget>[
              provider.selectedItem == 0
                  ? TransactionDashoardPage()
                  : TransactionHistoryPage(),
              provider.selectedItem == 0
                  ? TransactionDashoardPage()
                  : TransactionHistoryPage(),
            ],
          ),
          drawer: DashboardMenu(),
          bottomNavigationBar: TransactionBottomAppBar(),
        );
      }),
    );
  }
}

class TransactionBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionBottomAppBarProvider>(
      builder: (context, provider, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            BottomAppBar(
              color: Theme.of(context).bottomAppBarTheme.color,
              child: TabBar(
                controller: provider.tabController,
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
                      margin: EdgeInsets.only(right: 35.0),
                      child: Column(
                        children: <Widget>[
                          if (provider.selectedItem == 0)
                            Image.asset(bottom_tab),
                          Expanded(
                            child: Center(
                                child: Container(
                              margin: EdgeInsets.only(top: 16.0),
                              child: Image.asset(provider.selectedItem == 0
                                  ? bottom_release_on
                                  : bottom_release_off),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(left: 35.0),
                      child: Column(
                        children: <Widget>[
                          if (provider.selectedItem == 1)
                            Image.asset(bottom_tab),
                          Expanded(
                            child: Center(
                                child: Container(
                              margin: EdgeInsets.only(top: 16.0),
                              child: Image.asset(provider.selectedItem == 1
                                  ? bottom_history_on
                                  : bottom_history_off),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
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
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard_dialog.dart';
import 'package:annuluswallet/view/screens/main/dashboard_main_screen.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_history.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/bottom_app_bar.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    Provider.of<BottomAppBarProvider>(context, listen: false).setTabController =
        controller;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomAppBarProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: <Widget>[
            DefaultTabController(
              length: 2,
              child: Scaffold(
                key: _globalKey,
                appBar: provider.selectedItem == 0
                    ? rapidAppBar(context: context, globalKey: _globalKey)
                    : transactionAppBar(context, provider),
                body: TabBarView(
                  controller: controller,
                  children: [
                    provider.selectedItem == 0
                        ? DashboardMainScreen()
                        : TransactionHistoryPage(),
                    provider.selectedItem == 0
                        ? DashboardMainScreen()
                        : TransactionHistoryPage(),
                  ],
                ),
                drawer: SpecialMenu(),
                bottomNavigationBar: provider.getDialogStatus
                    ? BottomAppBar(
                        color: Colors.black,
                      )
                    : RapidBottomAppBar(),
              ),
            ),
            if (provider.getDialogStatus) DashboardDialog()
          ],
        );
      },
    );
  }

  Widget transactionAppBar(
      BuildContext context, BottomAppBarProvider provider) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 80),
      child: Container(
        color: Theme.of(context).appBarTheme.color,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  child: Image.asset(
                    leftArrow,
                    color: Theme.of(context).iconTheme.color,
                    height: 30.0,
                    width: 30.0,
                  ),
                  onTap: () {
                    provider.setIndex = 0;
                  },
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "All Transactions",
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(logo2),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

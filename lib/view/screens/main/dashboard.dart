import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/main/dashboard_main_screen.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_history.dart';
import 'package:annuluswallet/view/widget/bottom_app_bar.dart';
import 'package:annuluswallet/view/components/custom_appBar.dart';
import 'package:annuluswallet/view/screens/main/components/transaction_dialog.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 80.0),
        child: _tabController.index == 0
            ? DashboardAppBar(globalKey: _globalKey)
            : TransactionAppBar(title: "All Transactions"),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          children: [
            _tabController.index == 0
                ? DashboardMainScreen()
                : TransactionHistoryPage(),
            _tabController.index == 1
                ? TransactionHistoryPage()
                : DashboardMainScreen(),
          ],
        ),
      ),
      drawer: SpecialMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          rotate,
          height: 35.0,
          width: 35.0,
        ),
        onPressed: () => TransactionDialog.transactionDialog(
          context: context,
        ),
      ),
      bottomNavigationBar: RapidBottomAppBar(
        tabController: _tabController,
      ),
    );
  }
}

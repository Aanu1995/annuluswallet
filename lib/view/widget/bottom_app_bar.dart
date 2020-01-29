import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class RapidBottomAppBar extends StatelessWidget {
  final tabController;
  RapidBottomAppBar({this.tabController});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        BottomAppBar(
          color: Theme.of(context).bottomAppBarTheme.color,
          child: TabBar(
            controller: tabController,
            labelColor: Color(0xFFFFFFFF),
            unselectedLabelColor: Color(0xFF909090),
            indicatorColor: Theme.of(context).bottomAppBarTheme.color,
            tabs: <Widget>[
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 35.0),
                  child: Column(
                    children: <Widget>[
                      if (tabController.index == 0) Image.asset(bottom_tab),
                      Expanded(
                        child: Center(
                            child: Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Image.asset(tabController.index == 0
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
                  margin: EdgeInsets.only(left: 35.0),
                  child: Column(
                    children: <Widget>[
                      if (tabController.index == 1) Image.asset(bottom_tab),
                      Expanded(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 16.0),
                            child: Image.asset(tabController.index == 1
                                ? bottom_history_on
                                : bottom_history_off),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

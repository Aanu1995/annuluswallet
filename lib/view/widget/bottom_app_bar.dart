import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';

class RapidBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomAppBarProvider>(
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
              child: InkWell(
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
                onTap: () {
                  provider.setDialogStatus = true;
                },
              ),
            )
          ],
        );
      },
    );
  }
}

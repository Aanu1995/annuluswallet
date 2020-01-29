import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class RapidBottomAppBar extends StatelessWidget {
  final tabController;
  RapidBottomAppBar({this.tabController});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        BottomAppBar(
          color: theme.bottomAppBarTheme.color,
          child: TabBar(
            controller: tabController,
            labelColor: Color(0xFFFFFFFF),
            unselectedLabelColor: Color(0xFF909090),
            indicatorColor: Theme.of(context).bottomAppBarTheme.color,
            tabs: <Widget>[
              _TabItem(
                tabController: tabController,
                index: 0,
                image: bottom_wallet_off,
              ),
              _TabItem(
                tabController: tabController,
                index: 1,
                image: bottom_history_off,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final tabController;
  final index;
  final image;
  const _TabItem({this.tabController, this.index, this.image});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: tabController.index == index
                ? theme.iconTheme.color
                : Colors.transparent,
            height: 2.0,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          EmptySpace(multiple: 0.5),
          Image.asset(
            image,
            height: 30.0,
            width: 30.0,
            color: tabController.index == index
                ? Colors.white
                : Colors.grey.shade500,
          )
        ],
      ),
    );
  }
}

import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/router/router.dart';

class AppBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 10),
        child: Image.asset(
          logo,
          height: 40,
          width: 120,
        ),
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset(
        leftArrow,
        height: 28.0,
        width: 28.0,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

class AppBarDrawerLogo extends StatelessWidget {
  final globalKey;
  AppBarDrawerLogo({this.globalKey});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                logo,
                height: 40,
                width: 120,
              ),
            ),
            Positioned(
              left: 0.0,
              child: InkWell(
                onTap: () {
                  globalKey.currentState.openDrawer();
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 3.0,
                    bottom: 3.0,
                  ),
                  child: Image.asset(
                    drawer,
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardAppBar extends StatelessWidget {
  final globalKey;
  const DashboardAppBar({this.globalKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.color,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  logo,
                  height: 35,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      globalKey.currentState.openDrawer();
                    },
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          drawer,
                          height: 25.0,
                          color: Theme.of(context).iconTheme.color,
                          width: 25.0,
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
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      lock,
                      height: 28.0,
                      width: 28.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final icon;
  final globalKey;
  final bool leadingIcon;
  const TransactionAppBar({
    this.title,
    this.subtitle,
    this.icon,
    this.globalKey,
    this.leadingIcon = true,
  });
  @override
  Widget build(BuildContext context) {
    final primaryTheme = Theme.of(context).primaryTextTheme;
    return Container(
      color: Theme.of(context).appBarTheme.color,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              leadingIcon
                  ? InkWell(
                      child: Image.asset(
                        icon ?? leftArrow,
                        color: Theme.of(context).iconTheme.color,
                        height: 28.0,
                        width: 28.0,
                      ),
                      onTap: () => globalKey == null
                          ? Router.goBack(context: context)
                          : globalKey.currentState.openDrawer(),
                    )
                  : Offstage(),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        title,
                        style: primaryTheme.title.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      subtitle == null
                          ? Offstage()
                          : Text(
                              subtitle ?? "To Own Address",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            )
                    ],
                  ),
                  EmptySpace(),
                  Image.asset(logo2, height: 40.0, width: 40.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

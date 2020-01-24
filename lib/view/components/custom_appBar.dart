import 'package:annuluswallet/model/images.dart';
import 'package:flutter/material.dart';

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
        color: Theme.of(context).iconTheme.color,
        width: 28.0,
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

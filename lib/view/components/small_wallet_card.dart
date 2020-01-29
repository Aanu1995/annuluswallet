import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/components/empty_space.dart';

class SmallWalletCard extends StatelessWidget {
  final Color color;
  final String walletType;
  final String value1;
  final String value2;
  const SmallWalletCard(
      {this.color, this.value1, this.value2, this.walletType});
  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            walletType,
            style: primaryTextTheme.subhead.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(currency),
                  EmptySpace(),
                  Text(
                    "$value1",
                    style: primaryTextTheme.subhead.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              EmptySpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "\$$value2",
                    style: primaryTextTheme.subtitle,
                  ),
                  EmptySpace(),
                  Text(
                    "USD",
                    style: primaryTextTheme.subtitle.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

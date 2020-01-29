import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class WalletCard extends StatelessWidget {
  final String walletType;
  final String amount1;
  final String amount2;
  final String amountUSD;
  final String amountBTC;
  final String date;
  final String id;
  final Color color;
  final List<Color> gradientColor;

  WalletCard({
    @required this.walletType,
    @required this.amount1,
    @required this.amount2,
    @required this.amountBTC,
    @required this.amountUSD,
    @required this.date,
    @required this.id,
    this.color,
    this.gradientColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 16.0,
        bottom: 10.0,
      ),
      decoration: color == null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: gradientColor))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            walletType,
            style: theme.primaryTextTheme.title.copyWith(
              color: Colors.white,
            ),
          ),
          EmptySpace(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(currency),
                  EmptySpace(),
                  Text(
                    amount1,
                    style: theme.primaryTextTheme.display1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "RECENT",
                      style: TextStyle(
                        fontSize: 14.0,
                        letterSpacing: 2.0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      amount2,
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(
                        date,
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      amountUSD,
                      style: TextStyle(
                        fontSize: 14.0,
                        letterSpacing: 1.2,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    child: Text(
                      "USD",
                      style: TextStyle(
                        fontSize: 14.0,
                        letterSpacing: 1.2,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  id,
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  amountBTC,
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              EmptySpace(),
              Text(
                "BTC",
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.2,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

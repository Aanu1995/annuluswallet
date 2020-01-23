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

  WalletCard(
      {@required this.walletType,
      @required this.amount1,
      @required this.amount2,
      @required this.amountBTC,
      @required this.amountUSD,
      @required this.date,
      @required this.id,
      this.color,
      this.gradientColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.only(left: 30.0, right: 20.0, top: 16.0, bottom: 10.0),
      decoration: color == null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: gradientColor))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              walletType,
              style: TextStyle(
                fontSize: 16.0,
                letterSpacing: 1.0,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(currency),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    amount1,
                    style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 1.2,
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
              SizedBox(
                width: 10.0,
              ),
              Container(
                child: Text(
                  "BTC",
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 1.2,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

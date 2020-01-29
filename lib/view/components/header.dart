import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String amount;
  final String dollarValue;
  final String bitCoinValue;
  Header({this.amount, this.dollarValue, this.bitCoinValue});

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Container(
      padding: EdgeInsets.only(left: 24.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                amount,
                style: TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 1.0,
                  color: Color(0xFF2ff685),
                ),
              ),
              EmptySpace(multiple: 0.3),
              Text(
                "Total Portfolio",
                style: primaryTextTheme.subtitle.copyWith(
                  color: Color(0xFF2ff685),
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            bitCoinValue,
            style: primaryTextTheme.subhead.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            dollarValue,
            style: primaryTextTheme.subhead.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  final String amount;
  final String dollarValue;
  final String bitCoinValue;
  Header2({this.amount, this.dollarValue, this.bitCoinValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Total Portfolio",
            style: TextStyle(
              fontSize: 13.0,
              letterSpacing: 1.2,
              color: Color(0xFF2ff685),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  amount,
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                "RPD",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2ff685),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  bitCoinValue,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  dollarValue,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
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

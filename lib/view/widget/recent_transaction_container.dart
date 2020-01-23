import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:annuluswallet/model/images.dart';

class TransactionContainer extends StatelessWidget {
  final String walletType;
  final String date;
  final String time;
  final String amount;
  final bool isDeposit;
  final IconData icon;

  TransactionContainer(
      {@required this.walletType,
      @required this.icon,
      @required this.date,
      @required this.amount,
      this.time,
      @required this.isDeposit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 5.0, right: 8.0, top: 8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.transparent,
        border: Border.all(color: Color(0xFF606060), width: 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Image.asset(walletTrans),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          walletType,
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          amount,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: isDeposit
                                  ? Color(0xFF05a67b)
                                  : Color(0xFFff5f71),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 10.0,
                            letterSpacing: 0.8,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        if (time != null)
                          Icon(
                            FontAwesomeIcons.clock,
                            size: 10.0,
                            color: Colors.white,
                          ),
                        if (time != null)
                          SizedBox(
                            width: 5.0,
                          ),
                        if (time != null)
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 10.0,
                              letterSpacing: 0.8,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:annuluswallet/model/images.dart';

class RecentContainer extends StatelessWidget {
  final String walletType;
  final String date;
  final String time;
  final String amount;
  final bool isDeposit;
  final IconData icon;

  RecentContainer(
      {@required this.walletType,
      @required this.icon,
      @required this.date,
      @required this.amount,
      this.time,
      @required this.isDeposit});

  @override
  Widget build(BuildContext context) {
    final primaryTheme = Theme.of(context).primaryTextTheme;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
              Image.asset(walletTrans),
              const EmptySpace(multiple: 1.4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          walletType,
                          style: primaryTheme.subhead.copyWith(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          amount,
                          style: primaryTheme.subhead.copyWith(
                            fontWeight: FontWeight.w400,
                            color: isDeposit
                                ? Color(0xFF05a67b)
                                : Color(0xFFff5f71),
                          ),
                        ),
                      ],
                    ),
                    const EmptySpace(multiple: 0.6),
                    Row(
                      children: <Widget>[
                        Text(
                          date,
                          style: primaryTheme.caption.copyWith(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        const EmptySpace(multiple: 0.6),
                        if (time != null)
                          Icon(
                            FontAwesomeIcons.clock,
                            size: 10.0,
                            color: Colors.white,
                          ),
                        if (time != null) const EmptySpace(multiple: 0.6),
                        if (time != null)
                          Text(
                            time,
                            style: primaryTheme.caption.copyWith(
                              color: Colors.white,
                              fontSize: 10.0,
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

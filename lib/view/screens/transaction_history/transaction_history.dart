import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:annuluswallet/view/widget/wallet_item_container.dart';

class TransactionHistoryPage extends StatelessWidget {
  final List<Request> list = [
    Request(
      "Rw5k8966hdtheu68389376eyuy3",
      0,
      "31 JAN 2019",
      1000000.04,
    ),
    Request(
      "Rw5k8966hdtheu68389376eyuy3",
      1,
      "31 JAN 2019",
      343452.05,
    ),
    Request(
      "Rw5k8966hdtheu68389376eyuy3",
      0,
      "31 JAN 2019",
      1000000.04,
    ),
    Request(
      "Rw5k8966hdtheu68389376eyuy3",
      0,
      "31 JAN 2019",
      71000000.00,
    ),
    Request(
      "Rw5k8966hdtheu68389376eyuy3",
      0,
      "31 JAN 2019",
      71000000.00,
    ),
    Request(
      "Rw5k8966hdtheu68389376eyuy3",
      0,
      "4 JAN 2019",
      1000000.04,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "71,000,999.09",
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      color: Color(0xFF2ff685),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "RPD",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1ff079),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "B1.505398",
                    style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "\$10.68k USD",
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "MARKET VALUE",
                        style: TextStyle(
                          fontSize: 11.0,
                          letterSpacing: 1.0,
                          color: Color(0xFFbdbdbd),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        ...list.map((f) => WalletAllTransactionContainer(f)).toList()
      ],
    );
  }
}

class Request {
  String id;
  int transactionType;
  String date;
  double amount;
  String formattedAmount;

  Request(this.id, this.transactionType, this.date, this.amount) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: amount);
    this.formattedAmount = fmf.output.nonSymbol;
  }
}

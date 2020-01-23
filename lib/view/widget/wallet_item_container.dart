import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_details.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_history.dart';

class WalletAllTransactionContainer extends StatelessWidget {
  final Request request;
  WalletAllTransactionContainer(this.request);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TransactionDetails()));
      },
      child: Container(
        height: 120.0,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.transparent,
          border: Border.all(color: Color(0xFF606060), width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(request.transactionType == 0 ? receive : sent),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        request.transactionType == 0 ? "Received" : "Sent",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).textTheme.title.color,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${request.id}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${request.transactionType == 0 ? "+" : "-"}${request.formattedAmount.substring(0, request.formattedAmount.length - 3)}",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: request.transactionType == 0
                                    ? Color(0xFF05a67b)
                                    : Color(0xFF92404d),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${request.formattedAmount.substring(request.formattedAmount.length - 3)}",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: request.transactionType == 0
                                    ? Color(0xFF05a67b)
                                    : Color(0xFF92404d),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  request.date,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

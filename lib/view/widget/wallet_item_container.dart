import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_details.dart';
import 'package:annuluswallet/view/screens/transaction_history/transaction_history.dart';

class WalletAllTransactionContainer extends StatelessWidget {
  final Request request;
  WalletAllTransactionContainer(this.request);

  @override
  Widget build(BuildContext context) {
    final primaryTheme = Theme.of(context).primaryTextTheme;
    return GestureDetector(
      onTap: () => Router.goToWidget(
        context: context,
        page: TransactionDetails(),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
                EmptySpace(multiple: 2.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        request.transactionType == 0 ? "Received" : "Sent",
                        style: primaryTheme.subhead.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const EmptySpace(),
                      Text(
                        "${request.id}",
                        style: primaryTheme.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const EmptySpace(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${request.transactionType == 0 ? "+" : "-"}${request.formattedAmount.substring(0, request.formattedAmount.length - 3)}",
                              style: primaryTheme.title.copyWith(
                                fontWeight: FontWeight.w300,
                                color: request.transactionType == 0
                                    ? Color(0xFF05a67b)
                                    : Color(0xFF92404d),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "${request.formattedAmount.substring(request.formattedAmount.length - 3)}",
                              style: primaryTheme.caption.copyWith(
                                fontWeight: FontWeight.w300,
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
                EmptySpace(multiple: 2.5),
                Container(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text(
                    request.date,
                    style: primaryTheme.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
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

import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class GetWallet extends StatelessWidget {
  final Wallet wallet;
  final Function onTap;
  final Color color = Colors.black;

  GetWallet({this.onTap, this.wallet});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding:
            EdgeInsets.only(left: 10.0, right: 12.0, top: 10.0, bottom: 12.0),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey, width: 0.8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(walletTrans, height: 25.0, width: 25.0),
            const EmptySpace(horizontal: true, multiple: 2.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "${wallet.walletType}",
                                  style: textTheme.subtitle,
                                ),
                                EmptySpace(multiple: 0.8),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "${wallet.formattedAmount.substring(0, wallet.formattedAmount.length - 3)}",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${wallet.formattedAmount.substring(wallet.formattedAmount.length - 3)}",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                EmptySpace(multiple: 0.8),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            "${wallet.id}",
                            style: textTheme.caption,
                          ),
                        )
                      ],
                    ),
                  ),
                  EmptySpace(horizontal: true),
                  Icon(Icons.arrow_forward_ios, size: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

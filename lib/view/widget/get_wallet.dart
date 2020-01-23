import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';

class GetWallet extends StatelessWidget {
  final Wallet wallet;
  final Function onTap;
  final Color color = Colors.black;

  GetWallet({this.onTap, this.wallet});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 12.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey, width: 0.8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(walletTrans),
            SizedBox(
              width: 16.0,
            ),
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
                                  style: TextStyle(
                                    fontSize: 19.0,
                                    color: color,
                                    fontWeight: FontWeight.w400,
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
                                            "${wallet.formattedAmount.substring(0, wallet.formattedAmount.length - 3)}",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${wallet.formattedAmount.substring(wallet.formattedAmount.length - 3)}",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            "${wallet.id}",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: color,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 22.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';

class SelectedWalletWithoutCloseButton extends StatelessWidget {
  final Wallet wallet;
  SelectedWalletWithoutCloseButton({this.wallet});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 5.0),
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
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
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${wallet.walletType}",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Theme.of(context).appBarTheme.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "${wallet.formattedAmount}",
                      style: TextStyle(
                          fontSize: 21.0,
                          color: Theme.of(context).appBarTheme.color,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(
                        "${wallet.id}",
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 0.8,
                          color: Theme.of(context).appBarTheme.color,
                        ),
                      ),
                    ),
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

class SelectedWallet extends StatelessWidget {
  final Wallet wallet;
  final Function onPressed;
  SelectedWallet({this.wallet, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topCenter,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 12.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFbfe9cd),
        border: Border(
          right: BorderSide(
            color: Theme.of(context).iconTheme.color,
            width: 3.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${wallet.walletType}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${wallet.formattedAmount.substring(0, wallet.formattedAmount.length - 3)}",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).appBarTheme.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "${wallet.formattedAmount.substring(wallet.formattedAmount.length - 3)}",
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Theme.of(context).appBarTheme.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text(
                        "${wallet.id}",
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 0.8,
                          color: Theme.of(context).appBarTheme.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 32.0,
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(0.0),
                onPressed: onPressed,
              )
            ],
          ),
        ],
      ),
    );
  }
}

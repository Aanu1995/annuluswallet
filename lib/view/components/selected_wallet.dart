import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class SelectedWalletWithoutCloseButton extends StatelessWidget {
  final Wallet wallet;
  SelectedWalletWithoutCloseButton({this.wallet});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: AlignmentDirectional.topCenter,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: double.maxFinite,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(walletTrans, height: 25.0, width: 25.0),
              const EmptySpace(multiple: 2.5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${wallet.walletType}",
                      style: textTheme.subtitle,
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
                    EmptySpace(multiple: 0.6),
                    Text(
                      "${wallet.id}",
                      style: textTheme.caption.copyWith(
                        letterSpacing: 1.2,
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
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: AlignmentDirectional.topCenter,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color(0xFFbfe9cd),
        border: Border(
          right:
              BorderSide(color: Theme.of(context).iconTheme.color, width: 3.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(walletTrans, height: 25.0, width: 25.0),
              const EmptySpace(multiple: 2.5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${wallet.walletType}",
                      style: textTheme.subtitle,
                    ),
                    const EmptySpace(multiple: 0.8),
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
                    const EmptySpace(multiple: 0.8),
                    Text(
                      "${wallet.id}",
                      style: textTheme.caption,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 25.0,
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

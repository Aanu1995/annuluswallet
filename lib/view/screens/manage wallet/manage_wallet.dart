import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/manage%20wallet/create_new_wallet.dart';
import 'package:annuluswallet/view/screens/transfer/transfer_page.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';

class ManageWallet extends StatefulWidget {
  @override
  _ManageWalletState createState() => _ManageWalletState();
}

class _ManageWalletState extends State<ManageWallet> {
  bool isWalletExceeded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RapidAppBarBackButton(
          preContext: context, appTitle: "Manage Wallets"),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Text(
                "MY WALLETS",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 2.0,
                  color: Colors.black,
                ),
              ),
              ButtonFilled(
                text: "CREATE NEW WALLET",
                height: 45.0,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                onTap: () => Router.goToWidget(
                  context: context,
                  page: CreateNewWallet(),
                ),
              ),
              isWalletExceeded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "Sorry, a maximum limit of 5 wallets accounts exists.",
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    )
                  : Container(),
              for (int i = 0; i < list.length; i++)
                MyWallet(
                  wallet: list[i],
                  onPressed: () {},
                ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWallet extends StatelessWidget {
  final Wallet wallet;
  final Function onPressed;
  final Color color = Colors.black;

  MyWallet({this.onPressed, this.wallet});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey, width: 0.8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            currency,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  fontSize: 13.0,
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
                        Container(
                          child: Text(
                            "${wallet.id}",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 25.0,
                      ),
                      onPressed: onPressed,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/controller/app_function.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/receive/request_payment.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/routes.dart';
import 'package:annuluswallet/view/widget/selected_wallet.dart';

import 'package:screenshot/screenshot.dart';

class PaymentPage extends StatefulWidget {
  final String label;
  final String amount;
  final Wallet wallet;

  PaymentPage({this.wallet, this.amount, this.label});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  ScreenshotController controller = ScreenshotController();
  bool repaint = false;

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return WillPopScope(
      onWillPop: () {
        gotoDashBoard(context: context, provider: provider);
        return;
      },
      child: Scaffold(
        key: _globalKey,
        appBar: RapidAppBarPage(
            preContext: context,
            appTitle: "Receive",
            icon: drawer,
            globalKey: _globalKey),
        backgroundColor: Colors.white,
        body: Consumer<RapidsProvider>(
          builder: (context, clipboard, child) {
            return Stack(
              children: <Widget>[
                Screenshot(
                  controller: controller,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "TO ADDRESS",
                            style: TextStyle(
                              fontSize: 18.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).appBarTheme.color,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          SelectedWalletWithoutCloseButton(
                              wallet: widget.wallet),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 16.0, left: 16.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: ButtonCopy(
                                    title: "COPY ADDRESS",
                                    onTap: () {
                                      AppFunction().copyClipboard(
                                          widget.wallet.id, clipboard);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 150.0,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(qrcode),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ButtonCopy(
                                          title: "SAVE URI",
                                          onTap: () {},
                                        ),
                                        ButtonCopy(
                                          title: "SAVE QR",
                                          onTap: () {},
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "PAYMENT INFO",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      letterSpacing: 2.0,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      paymentDetails(
                                          context: context,
                                          title: "Label",
                                          details: widget.label),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      paymentDetails(
                                          context: context,
                                          title: "Address",
                                          details: widget.wallet.id),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      paymentDetails(
                                          context: context,
                                          title: "Amount",
                                          details: widget.amount),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      paymentDetails(
                                          context: context,
                                          title: "Message",
                                          details:
                                              "Send via annuluswallet Android 17-06-2019 23:11")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                InkWell(
                                  onTap: () async {
                                    controller.capture().then((image) async {
                                      Uint8List pngBytes =
                                          image.readAsBytesSync();
                                      await Share.file(
                                          'My payment Details',
                                          'payment.png',
                                          pngBytes,
                                          "payment/png",
                                          text: 'My payment Details');
                                    });
                                  },
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        "SHARE PAYMENT",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          letterSpacing: 3.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Text(
                                      "MAKE ANOTHER PAYMENT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Theme.of(context)
                                              .iconTheme
                                              .color),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    gotoDashBoard(
                                        context: context, provider: provider);
                                  },
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Center(
                                      child: Text(
                                        "DASHBOARD",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (clipboard.getClipboardStatus) Center(child: CopyDialog())
              ],
            );
          },
        ),
        drawer: SpecialMenu(),
      ),
    );
  }

  Widget paymentDetails({BuildContext context, String title, String details}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              letterSpacing: 1.0,
              color: Theme.of(context).scaffoldBackgroundColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: Text(
            details,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 1.0,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        )
      ],
    );
  }
}

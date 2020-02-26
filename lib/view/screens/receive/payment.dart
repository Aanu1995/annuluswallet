import 'dart:typed_data';
import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/widget/routes.dart';

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
    final clipboard = Provider.of<ClipBoardProvider>(context);
    return WillPopScope(
      onWillPop: () {
        gotoDashBoard(context: context, provider: provider);
        return;
      },
      child: Scaffold(
        key: _globalKey,
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 70),
          child: TransactionAppBar(
              title: "Receive",
              subtitle: "To Own Address",
              icon: drawer,
              globalKey: _globalKey),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Screenshot(
              controller: controller,
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      HeadText(text: "TO ADDRESS"),
                      SelectedWalletWithoutCloseButton(wallet: widget.wallet),
                      const EmptySpace(multiple: 2.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: Scan(
                          title: "COPY ADDRESS",
                          onTap: () => clipboard.setClipboardStatus(
                              widget.wallet.id, true),
                        ),
                      ),
                      const EmptySpace(multiple: 4.0),
                      Image.asset(qrcode, height: 150.0, width: 300.0),
                      const EmptySpace(multiple: 2.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Scan(title: "SAVE URI", onTap: () {}),
                          Scan(title: "SAVE QR", onTap: () {})
                        ],
                      ),
                      const EmptySpace(multiple: 4.0),
                      HeadText(text: "PAYMENT INFO"),
                      const EmptySpace(multiple: 2.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          paymentDetails(
                              context: context,
                              title: "Label",
                              details: widget.label),
                          const EmptySpace(multiple: 1.5),
                          paymentDetails(
                              context: context,
                              title: "Address",
                              details: widget.wallet.id),
                          const EmptySpace(multiple: 1.5),
                          paymentDetails(
                              context: context,
                              title: "Amount",
                              details: widget.amount),
                          const EmptySpace(multiple: 1.5),
                          paymentDetails(
                              context: context,
                              title: "Message",
                              details:
                                  "Send via annuluswallet Android 17-06-2019 23:11")
                        ],
                      ),
                      EmptySpace(multiple: 6.0),
                      Column(
                        children: <Widget>[
                          CustomButton(
                            text: "SHARE PAYMENT",
                            onPressed: () async {
                              controller.capture().then((image) async {
                                Uint8List pngBytes = image.readAsBytesSync();
                                await Share.file('My payment Details',
                                    'payment.png', pngBytes, "payment/png",
                                    text: 'My payment Details');
                              });
                            },
                          ),
                          EmptySpace(multiple: 2.0),
                          CustomOutlineButton(
                            text: "MAKE ANOTHER PAYMENT",
                            color: Theme.of(context).iconTheme.color,
                            onPressed: () {},
                          ),
                          EmptySpace(multiple: 2.0),
                          CustomOutlineButton(
                            text: "DASHBOARD",
                            color: Theme.of(context).iconTheme.color,
                            onPressed: () => gotoDashBoard(
                                context: context, provider: provider),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (clipboard.getClipboardStatus)
              Center(
                child: CopyDialog(),
              )
          ],
        ),
        drawer: SpecialMenu(),
      ),
    );
  }

  Widget paymentDetails({BuildContext context, String title, String details}) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textTheme.subtitle.copyWith(fontWeight: FontWeight.w500),
        ),
        const EmptySpace(),
        Text(
          details,
          style: textTheme.caption.copyWith(
            color: Theme.of(context).scaffoldBackgroundColor,
            letterSpacing: 1.0,
          ),
        )
      ],
    );
  }
}

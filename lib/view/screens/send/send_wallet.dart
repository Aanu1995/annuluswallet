import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/scan.dart';
import 'package:annuluswallet/view/components/selected_wallet.dart';
import 'package:annuluswallet/view/screens/send/components/head_text.dart';
import 'package:flutter/material.dart';

import 'package:majascan/majascan.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/send/send_confirm_payment.dart';
import 'package:annuluswallet/view/screens/transfer/function_widget.dart';
import 'package:annuluswallet/router/router.dart';

class SendWallet extends StatefulWidget {
  final Wallet wallet;
  SendWallet({this.wallet});

  @override
  _SendWalletState createState() => _SendWalletState();
}

class _SendWalletState extends State<SendWallet> {
  TextEditingController labelController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final Color color = Colors.black;
  bool isScanned = false;

  FocusNode labelFocus = FocusNode();
  bool isLabelFocus = false;
  FocusNode addressFocus = FocusNode();
  bool isAddressFocus = false;
  FocusNode amountFocus = FocusNode();
  bool isAmountFocus = false;

  @override
  void initState() {
    super.initState();
    labelFocus.addListener(() {
      isLabelFocus = labelFocus.hasFocus;
    });
    addressFocus.addListener(() {
      isAddressFocus = addressFocus.hasFocus;
    });
    amountFocus.addListener(() {
      isAmountFocus = amountFocus.hasFocus;
    });
  }

  @override
  void dispose() {
    labelFocus.dispose();
    addressFocus.dispose();
    amountFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    final borderColor = Theme.of(context).iconTheme.color;
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.5),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Send",
          subtitle: "To External Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              HeadText(),
              SelectedWallet(
                wallet: widget.wallet,
                onPressed: () => Navigator.pop(context),
              ),
              HeadText(text: "TO ADDRESS"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: addressController,
                      focusNode: addressFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: border,
                        focusedBorder: border,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelText: "Receiving Address (RPD)",
                      ),
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(amountFocus);
                      },
                    ),
                    EmptySpace(multiple: 2.0),
                    Align(
                      alignment: Alignment.topRight,
                      child: Scan(
                        title: "SCAN QR CODE",
                        onTap: () async {
                          String qrResult = await MajaScan.startScan(
                              title: "SCAN QR CODE",
                              barColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              titleColor: Colors.white,
                              qRCornerColor: Colors.white,
                              qRScannerColor: Colors.deepPurple,
                              flashlightEnable: true);
                          if (qrResult != null) {
                            setState(() {
                              isScanned = true;
                            });
                          }
                        },
                      ),
                    ),
                    EmptySpace(multiple: 4.0),
                    TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      focusNode: amountFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: border,
                        focusedBorder: border,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelText: "Amount (RPD)",
                      ),
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(labelFocus);
                      },
                    ),
                    EmptySpace(multiple: 3.0),
                    TextField(
                      controller: labelController,
                      focusNode: labelFocus,
                      decoration: InputDecoration(
                        enabledBorder: border,
                        focusedBorder: border,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        labelText: "Label (Optional)",
                      ),
                    ),
                    EmptySpace(multiple: 4.0),
                    CustomButton(
                      text: "REQUEST PAYMENT",
                      onPressed: () => Router.goToWidget(
                        context: context,
                        page: SendConfirmPayment(
                          fromWallet: widget.wallet,
                          address: addressController.text,
                          label: labelController.text,
                          amount: amountController.text,
                        ),
                      ),
                    ),
                    EmptySpace(multiple: 2.0),
                    CustomOutlineButton(
                      text: "CANCEL",
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () {
                        TransferWidgetFunction().cancelPayment(
                            context: context, provider: provider);
                      },
                    ),
                    EmptySpace(multiple: 2.0)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

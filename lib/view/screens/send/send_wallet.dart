import 'package:flutter/material.dart';

import 'package:majascan/majascan.dart';
import 'package:provider/provider.dart';

import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/receive/request_payment.dart';
import 'package:annuluswallet/view/screens/send/send_confirm_payment.dart';
import 'package:annuluswallet/view/screens/transfer/function_widget.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/selected_wallet.dart';
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
  bool isValidateLabel;
  bool isValidateAmount;
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
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          appBar: RapidAppBarPage(
              preContext: context,
              appTitle: "Send",
              address: "To External Address"),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "FROM ADDRESS",
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SelectedWallet(
                    wallet: widget.wallet,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "TO ADDRESS",
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      color: color,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          height: 20.0,
                          child: Text(
                            isAddressFocus
                                ? "Receiving Address (RPD)"
                                : isValidateLabel == true ||
                                        isValidateLabel == null
                                    ? "Receiving Address (RPD)"
                                    : "RPD Address is not recognised, please try again",
                            style: TextStyle(
                              color: isAddressFocus ||
                                      isValidateLabel == true ||
                                      isValidateLabel == null
                                  ? color
                                  : Color(0xFFf55d7f),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: isValidateLabel == true ||
                                      isValidateLabel == null
                                  ? Theme.of(context).iconTheme.color
                                  : Color(0xFFf55d7f),
                            ),
                          ),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: isValidateLabel == true ||
                                      isValidateLabel == null
                                  ? Theme.of(context).iconTheme.color
                                  : Color(0xFFf55d7f),
                            ),
                            child: TextField(
                              controller: addressController,
                              focusNode: addressFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: addressController.text.isEmpty
                                    ? SizedBox()
                                    : IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            addressController =
                                                TextEditingController();
                                          });
                                        },
                                      ),
                                focusColor: Theme.of(context).iconTheme.color,
                                hintText: "Receiving Address (RPD)",
                              ),
                              onSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(amountFocus);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ButtonCopy(
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 20.0,
                          child: Text(
                            isAmountFocus
                                ? "Amount (RPD)"
                                : isValidateAmount == true ||
                                        isValidateAmount == null
                                    ? "Amount (RPD)"
                                    : "Minimum amount must be more than 1RPD",
                            style: TextStyle(
                              color: isAmountFocus ||
                                      isValidateAmount == true ||
                                      isValidateAmount == null
                                  ? color
                                  : Color(0xFFf55d7f),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: isValidateAmount == true ||
                                      isValidateAmount == null
                                  ? Theme.of(context).iconTheme.color
                                  : Color(0xFFf55d7f),
                            ),
                          ),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: isValidateAmount == true ||
                                      isValidateAmount == null
                                  ? Theme.of(context).iconTheme.color
                                  : Color(0xFFf55d7f),
                            ),
                            child: TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              focusNode: amountFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusColor: Theme.of(context).iconTheme.color,
                                hintText: "Amount (RPD)",
                                suffixIcon: amountController.text.isEmpty
                                    ? SizedBox()
                                    : IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            amountController =
                                                TextEditingController();
                                          });
                                        },
                                      ),
                              ),
                              onSubmitted: (_) {
                                FocusScope.of(context).requestFocus(labelFocus);
                              },
                              onChanged: (value) {
                                /* FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
                                amount: double.parse(value));
                            String controller = fmf.output.nonSymbol;

                            amountController.text = controller; */
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 20.0,
                          child: Text(
                            isLabelFocus
                                ? "Label (Optional)"
                                : isValidateLabel == true ||
                                        isValidateLabel == null
                                    ? "Label (Optional)"
                                    : "Special characters not permitted, please try again",
                            style: TextStyle(
                              color: isLabelFocus ||
                                      isValidateLabel == true ||
                                      isValidateLabel == null
                                  ? color
                                  : Color(0xFFf55d7f),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: isValidateLabel == true ||
                                      isValidateLabel == null
                                  ? Theme.of(context).iconTheme.color
                                  : Color(0xFFf55d7f),
                            ),
                          ),
                          child: Theme(
                            data: ThemeData(
                              primaryColor: isValidateLabel == true ||
                                      isValidateLabel == null
                                  ? Theme.of(context).iconTheme.color
                                  : Color(0xFFf55d7f),
                            ),
                            child: TextField(
                              controller: labelController,
                              focusNode: labelFocus,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                suffixIcon: labelController.text.isEmpty
                                    ? SizedBox()
                                    : IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            labelController =
                                                TextEditingController();
                                          });
                                        },
                                      ),
                                focusColor: Theme.of(context).iconTheme.color,
                                hintText: "Label (Optional)",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        ButtonFilled(
                          text: "REQUEST PAYMENT",
                          height: 50.0,
                          margin: EdgeInsets.all(0.0),
                          onTap: () => Router.goToWidget(
                            context: context,
                            page: SendConfirmPayment(
                              fromWallet: widget.wallet,
                              address: addressController.text,
                              label: labelController.text,
                              amount: amountController.text,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ButtonNotFilled(
                          text: "CANCEL",
                          fontSize: 17.0,
                          height: 50.0,
                          margin: EdgeInsets.all(0.0),
                          onTap: () {
                            TransferWidgetFunction().cancelPayment(
                                context: context, provider: provider);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        if (isScanned)
          Scaffold(
            backgroundColor: darkBlue,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(copy),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Loading QR Scan Payment details...",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      color: dash,
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/transfer/function_widget.dart';
import 'package:annuluswallet/view/screens/transfer/transfer_confirm_payment.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/selected_wallet.dart';
import 'package:provider/provider.dart';

class FromWalletToSendWallet extends StatefulWidget {
  final Wallet fromWallet;
  final Wallet toWallet;
  FromWalletToSendWallet({this.fromWallet, this.toWallet});

  @override
  _FromWalletToSendWalletState createState() => _FromWalletToSendWalletState();
}

class _FromWalletToSendWalletState extends State<FromWalletToSendWallet> {
  final Color color = Colors.black;
  TextEditingController labelController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool isValidateLabel;
  bool isValidateAmount;
  FocusNode labelFocus = FocusNode();
  bool isLabelFocus = false;
  FocusNode amountFocus = FocusNode();
  bool isAmountFocus = false;
  bool status = false;

  @override
  void initState() {
    super.initState();
    labelFocus.addListener(() {
      isLabelFocus = labelFocus.hasFocus;
    });
    amountFocus.addListener(() {
      isAmountFocus = amountFocus.hasFocus;
    });
  }

  @override
  void dispose() {
    labelFocus.dispose();
    amountFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RapidAppBarPage(preContext: context, appTitle: "Transfer"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "FROM ADDRESS",
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 2.0,
                color: color,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SelectedWallet(
              wallet: widget.fromWallet,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "TO ADDRESS",
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 2.0,
                color: color,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SelectedWallet(
              wallet: widget.toWallet,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    height: 20.0,
                    child: Text(
                      isLabelFocus
                          ? "Label (Optional)"
                          : isValidateLabel == true || isValidateLabel == null
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
                        color:
                            isValidateLabel == true || isValidateLabel == null
                                ? Theme.of(context).iconTheme.color
                                : Color(0xFFf55d7f),
                      ),
                    ),
                    child: Theme(
                      data: ThemeData(
                        primaryColor:
                            isValidateLabel == true || isValidateLabel == null
                                ? Theme.of(context).iconTheme.color
                                : Color(0xFFf55d7f),
                      ),
                      child: TextField(
                        controller: labelController,
                        focusNode: labelFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: labelController.text.isEmpty
                              ? SizedBox()
                              : IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      labelController = TextEditingController();
                                    });
                                  },
                                ),
                          focusColor: Theme.of(context).iconTheme.color,
                          hintText: "Label",
                        ),
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(amountFocus);
                        },
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              isValidateLabel = false;
                            });
                          } else {
                            setState(() {
                              isValidateLabel = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 20.0,
                    child: Text(
                      isAmountFocus
                          ? "Amount (RPD)"
                          : isValidateAmount == true || isValidateAmount == null
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
                        color:
                            isValidateAmount == true || isValidateAmount == null
                                ? Theme.of(context).iconTheme.color
                                : Color(0xFFf55d7f),
                      ),
                    ),
                    child: Theme(
                      data: ThemeData(
                        primaryColor:
                            isValidateAmount == true || isValidateAmount == null
                                ? Theme.of(context).iconTheme.color
                                : Color(0xFFf55d7f),
                      ),
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        focusNode: amountFocus,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Theme.of(context).iconTheme.color,
                          hintText: "Receiving Amount",
                          suffixIcon: amountController.text.isEmpty
                              ? SizedBox()
                              : IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      amountController =
                                          TextEditingController();
                                    });
                                  },
                                ),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              isValidateAmount = false;
                            });
                          } else {
                            setState(() {
                              isValidateAmount = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  CustomButton(
                    text: "REQUEST PAYMENT",
                    onPressed: () => Router.goToWidget(
                      context: context,
                      page: TransferConfirmPayment(
                        fromWallet: widget.fromWallet,
                        toWallet: widget.toWallet,
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
                    height: 60.0,
                    margin: EdgeInsets.all(0.0),
                    onTap: () {
                      TransferWidgetFunction()
                          .cancelPayment(context: context, provider: provider);
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
    );
  }
}

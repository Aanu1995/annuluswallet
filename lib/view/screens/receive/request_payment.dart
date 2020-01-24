import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/receive/payment.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/selected_wallet.dart';

class RequestPaymentPage extends StatefulWidget {
  final Wallet wallet;
  RequestPaymentPage({this.wallet});

  @override
  _RequestPaymentPageState createState() => _RequestPaymentPageState();
}

class _RequestPaymentPageState extends State<RequestPaymentPage> {
  TextEditingController labelController = TextEditingController();
  TextEditingController amountController = TextEditingController();

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
    final clipboard = Provider.of<ClipBoardProvider>(context);
    return Scaffold(
      appBar: RapidAppBarPage(preContext: context, appTitle: "Receive"),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
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
                  SelectedWallet(
                    wallet: widget.wallet,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
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
                            onTap: () => clipboard.setClipboardStatus(
                                widget.wallet.id, true),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        if (isLabelFocus)
                          Container(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Label ",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "(Optional)",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: Theme.of(context).iconTheme.color),
                          ),
                          child: Theme(
                            data: ThemeData(
                                primaryColor:
                                    Theme.of(context).iconTheme.color),
                            child: TextField(
                              focusNode: labelFocus,
                              controller: labelController,
                              textInputAction: TextInputAction.next,
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
                                hintText: "Label",
                              ),
                              onSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(amountFocus);
                              },
                              onChanged: (value) {
                                setState(() {
                                  status = check(labelController.text,
                                      amountController.text);
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        if (isAmountFocus)
                          Container(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Receiving Amount (RPD) ",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "(Optional)",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: Theme.of(context).iconTheme.color),
                          ),
                          child: Theme(
                            data: ThemeData(
                                primaryColor:
                                    Theme.of(context).iconTheme.color),
                            child: TextField(
                              focusNode: amountFocus,
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
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
                                focusColor: Theme.of(context).iconTheme.color,
                                hintText: "Receiving Amount (RPD)",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  status = check(labelController.text,
                                      amountController.text);
                                });
                              },
                              onSubmitted: (value) {
                                FlutterMoneyFormatter fmf =
                                    FlutterMoneyFormatter(
                                        amount: double.parse(value));
                                amountController.text = fmf.output.nonSymbol;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        ButtonFilled(
                          text: "REQUEST PAYMENT",
                          color: status == true
                              ? Theme.of(context).iconTheme.color
                              : Theme.of(context)
                                  .iconTheme
                                  .color
                                  .withOpacity(0.3),
                          height: 50.0,
                          margin: EdgeInsets.all(0.0),
                          onTap: () {
                            if (status) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage(
                                            label: labelController.text,
                                            amount: amountController.text,
                                            wallet: widget.wallet,
                                          )),
                                  (Route<dynamic> route) => false);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ButtonNotFilled(
                          text: "CANCEL",
                          fontSize: 17.0,
                          height: 50.0,
                          margin: EdgeInsets.all(0.0),
                          onTap: () {},
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
          if (clipboard.getClipboardStatus)
            Center(
              child: CopyDialog(),
            )
        ],
      ),
    );
  }

  bool check(String label, String amount) {
    if (amount.isNotEmpty && label.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

// This widget is used to display the button in the clipboard and share
class ButtonCopy extends StatelessWidget {
  final String title;
  final Function onTap;
  ButtonCopy({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.0,
        width: 160,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).iconTheme.color, width: 2.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Theme.of(context).iconTheme.color),
          ),
        ),
      ),
    );
  }
}

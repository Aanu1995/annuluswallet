import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/widget/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';

class PaymentComplete extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final bool isSend;
  final String fromAddress;
  final String toAddress;
  final String label;
  final String transactionId;
  final String walletName;
  PaymentComplete({
    this.isSend = false,
    this.fromAddress = "",
    this.toAddress = "",
    this.label = "",
    this.transactionId = "",
    this.walletName = "",
  });

  final String date = DateFormat("MM/dd/yyyy").format(DateTime.now());
  final String time = DateFormat("hh:mm").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    final style1 = textTheme.subtitle.copyWith(
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    final style2 = textTheme.caption.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(copy),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                EmptySpace(horizontal: true, multiple: 2.5),
                Text(
                  "Payment Complete!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0,
                    letterSpacing: 1.0,
                    color: dash,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: HeadText(
                    text: "PAYMENT INFO",
                  ),
                ),
                const EmptySpace(multiple: 4.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // For the status starts here ->----------------------------
                      paymentDetails(
                        context: context,
                        title: "Status",
                        details: "1/12 Confirmations",
                      ),
                      EmptySpace(multiple: 2.0),
                      //for the Date and Time Starts here ->-----------------------------
                      paymentDetails(
                        context: context,
                        title: "Date and Time",
                        details: "$date $time",
                      ),
                      EmptySpace(multiple: 2.0),
                      // For the from wallet starts here ->------------------------------------
                      Text("From", style: style1),
                      EmptySpace(multiple: 0.6),
                      Text("Name: " + walletName, style: style2),
                      EmptySpace(multiple: 2.0),
                      //for the To wallet starts here ->--------------------------------
                      Text("To", style: style1),
                      EmptySpace(multiple: 0.6),
                      Text(toAddress, style: style2),
                      //for the label starts here ->---------------------------------
                      EmptySpace(multiple: 2.0),
                      Row(
                        children: <Widget>[
                          Text("Label", style: style1),
                          EmptySpace(multiple: 0.6),
                          Text("(Optional)", style: style2),
                        ],
                      ),
                      EmptySpace(multiple: 0.6),
                      Text(label, style: style2),
                      EmptySpace(multiple: 2.0),
                      // for thr net amount starts here ->---------------------------------------
                      Text("Net Amount", style: style1),
                      EmptySpace(multiple: 0.6),
                      Text("+2140.4112000000 RPD", style: style2),
                      EmptySpace(multiple: 0.6),
                      Text(
                        "Credit:" + " 2140.4112000000 RPD",
                        style: style2,
                      ),
                      EmptySpace(multiple: 2.0),
                      // for the transaction ID starts here ->----------------------------------------
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: paymentDetails(
                    context: context,
                    title: "Transaction ID",
                    details: transactionId,
                  ),
                ),
                CustomButton(
                  text: "VIEW TRANSACTION ID",
                  onPressed: () {},
                ),
                EmptySpace(multiple: 3.0),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      paymentDetails(
                          context: context,
                          title: "Message",
                          details:
                              "Send via annuluswallet Android 17-06-2019 23:11"),
                      EmptySpace(multiple: 2.0),
                      Row(
                        children: <Widget>[
                          Text("Output Index:", style: style1),
                          EmptySpace(multiple: 0.6),
                          Text("0", style: style2)
                        ],
                      ),
                      EmptySpace(multiple: 2.0),
                      Row(
                        children: <Widget>[
                          Text("Powered by", style: style1),
                          EmptySpace(multiple: 0.6),
                          Text(
                            "annuluswalletNetwork.io",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ],
                      ),
                      EmptySpace(multiple: 3.0),
                    ],
                  ),
                ),
                if (isSend)
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: CustomButton(
                      text: "SHARE PAYMENT",
                      onPressed: () {},
                    ),
                  ),
                CustomOutlineButton(
                  color: Theme.of(context).iconTheme.color,
                  text: "HOME",
                  onPressed: () {
                    gotoDashBoard(context: context, provider: provider);
                  },
                ),
                EmptySpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // This widget dispalys the details from the payment
  Widget paymentDetails({BuildContext context, String title, String details}) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textTheme.subtitle.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Theme.of(context).scaffoldBackgroundColor),
        ),
        EmptySpace(multiple: 0.6),
        Text(
          details,
          style: textTheme.caption.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 1.0,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        )
      ],
    );
  }
}

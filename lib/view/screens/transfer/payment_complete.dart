import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard_menu_drawer.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/routes.dart';

class PaymentComplete extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  bool isSend = false;
  String fromAddress = "";
  String toAddress = "";
  String label = "";
  String transactionId = "";
  String walletName = "";
  String date = DateFormat("MM/dd/yyyy").format(DateTime.now());
  String time = DateFormat("hh:mm").format(DateTime.now());
  PaymentComplete(
      {this.isSend,
      this.fromAddress,
      this.toAddress,
      this.label,
      this.transactionId,
      this.walletName});

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10.0))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    child: Image.asset(
                      drawer,
                      height: 25.0,
                      width: 25.0,
                    ),
                    onTap: () {
                      _globalKey.currentState.openDrawer();
                    },
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(copy),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Payment Complete!",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                          color: dash,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "PAYMENT INFO",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // For the status starts here ->----------------------------
                      paymentDetails(
                          context: context,
                          title: "Status",
                          details: "1/12 Confirmations"),
                      SizedBox(
                        height: 20.0,
                      ),
                      //for the Date and Time Starts here ->-----------------------------
                      paymentDetails(
                          context: context,
                          title: "Date and Time",
                          details: "$date $time"),
                      SizedBox(
                        height: 20.0,
                      ),
                      // For the from wallet starts here ->------------------------------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "From",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text(
                              "Name: " + walletName,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text(
                              fromAddress,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //for the To wallet starts here ->--------------------------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "To",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text(
                              toAddress,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //for the label starts here ->---------------------------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Label",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    letterSpacing: 1.0,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "(Optional)",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text(
                              label,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // for thr net amount starts here ->---------------------------------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Net Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text(
                              "+2140.4112000000 RPD",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            child: Text(
                              "Credit:" + " 2140.4112000000 RPD",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // for the transaction ID starts here ->----------------------------------------
                      paymentDetails(
                          context: context,
                          title: "Transaction ID",
                          details: transactionId),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
                ButtonFilled(
                  text: "VIEW TRANSACTION ID",
                  height: 50.0,
                  margin: EdgeInsets.all(0.0),
                  onTap: () {},
                ),
                SizedBox(
                  height: 30.0,
                ),
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Output Index",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: 16.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Powered by",
                            style: TextStyle(
                                fontSize: 16.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "annuluswalletNetwork.io",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
                if (isSend)
                  ButtonFilled(
                    text: "SHARE PAYMENT",
                    height: 50.0,
                    margin: EdgeInsets.all(0.0),
                    onTap: () {},
                  ),
                if (isSend)
                  SizedBox(
                    height: 20.0,
                  ),
                ButtonNotFilled(
                  text: "HOME",
                  margin: EdgeInsets.all(0.0),
                  height: 50.0,
                  onTap: () {
                    gotoDashBoard(context: context, provider: provider);
                  },
                ),
              ],
            ),
          ),
        ),
        drawer: SpecialMenu(),
      ),
    );
  }

  // This widget dispalys the details from the payment
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
              fontSize: 16.0,
              letterSpacing: 1.0,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/routes.dart';

class TransactionDetails extends StatelessWidget {
  String transactionId =
      "Rw34466osjSJA7Z1gdjdmhdnjjdkdhdjjdjkmasdkkd10ca8049417acerys";

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    final clipboard = Provider.of<ClipBoardProvider>(context);
    return Scaffold(
      appBar: rapidPageAppBar2(
        context: context,
        appTitle: "Mobile Wallet",
        image: leftArrow,
        size: 30.0,
        onTap: () => Navigator.pop(context),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "1,000,000.04",
                        style: TextStyle(
                          fontSize: 36.0,
                          letterSpacing: 1.0,
                          color: Color(0xFF2ff685),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "RPD",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1ff079),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 3.0,
                        width: 20.0,
                        color: Color(0xFF2ff685),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "10 of 10 Confirmations",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "28 JAN 2019",
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        FontAwesomeIcons.clock,
                        size: 12,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "11:30 AM",
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "758",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "CONFIRMATIONS",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Sent",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Icon(Icons.arrow_forward,
                            color: Colors.white, size: 25.0),
                      ),
                      Text(
                        "Received",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: 2.5,
                          width: MediaQuery.of(context).size.width / 2.0,
                        ),
                        Container(
                          color: Theme.of(context).iconTheme.color,
                          height: 2.5,
                          width: MediaQuery.of(context).size.width / 2.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "FOREIGN ADDRESS",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "MOBILE WALLET",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Text(
                          "Rw34466osjSJA7Z1gdjdmhdnjjdkdhdjjdjkmasdkk",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Text(
                          "W5jsjjkjndskkdsfbjkbjkdbjkfbkdbjkfbjdnjkndkfnk",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Transaction ID",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      transactionId,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.3,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () =>
                          clipboard.setClipboardStatus(transactionId, true),
                      child: Container(
                        height: 50.0,
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).iconTheme.color,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            "COPY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Theme.of(context).iconTheme.color),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonFilled(
                    text: "VIEW ON annuluswallet EXPLORER",
                    fontSize: 15.0,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CustomOutlineButton(
                    text: "CLOSE",
                    onPressed: () => gotoDashBoard(
                      context: context,
                      provider: provider,
                    ),
                  )
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
}

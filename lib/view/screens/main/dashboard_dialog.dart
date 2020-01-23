import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/receive/receive.dart';
import 'package:annuluswallet/view/screens/send/send_screen.dart';
import 'package:annuluswallet/view/screens/transfer/transfer_page.dart';

class DashboardDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomAppBarProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black54,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 3.0,
                  vertical: (MediaQuery.of(context).size.width) <
                          (MediaQuery.of(context).size.height)
                      ? 100.0
                      : 60),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  elevation: 10.0,
                  color: Color(0xFFeeeeee),
                  child: Container(
                    height: (MediaQuery.of(context).size.width) <
                            (MediaQuery.of(context).size.height)
                        ? (MediaQuery.of(context).size.width / 2.0)
                        : (MediaQuery.of(context).size.width / 2.0),
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Pay to",
                          style: TextStyle(
                              fontSize: 20.0, color: Color(0xFF222222)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                card(
                                    title: "Transfer",
                                    subtitle: "Within our own Address",
                                    logo: transfer,
                                    color: Color(0xFF74c5b0),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TransferPage()));
                                      provider.setDialogStatus = false;
                                    }),
                                card(
                                    title: "Send",
                                    subtitle: "To External Address",
                                    logo: sent,
                                    color: Color(0XFFf6a3ac),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SendPage()));
                                      provider.setDialogStatus = false;
                                    }),
                                card(
                                    title: "Receive",
                                    subtitle: "To own address",
                                    logo: receive,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReceivePage()));
                                      provider.setDialogStatus = false;
                                    },
                                    color: Color(0xFF74c5b0))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: Color(0xFF05a67b),
                child: Image.asset(
                  close,
                  height: 40,
                  fit: BoxFit.fitHeight,
                ),
              ),
              onTap: () {
                provider.setDialogStatus = false;
              },
            ),
          ),
        );
      },
    );
  }

  Widget card(
      {String title,
      String subtitle,
      Color color,
      String logo,
      Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200.0,
        padding:
            EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xFFbababa),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              logo,
              height: 60.0,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: Color(0xFF222222),
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF222222),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

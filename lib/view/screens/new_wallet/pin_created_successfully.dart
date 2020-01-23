import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/loading_wallet.dart';

class PinCreatedSuccessfullyPage extends StatefulWidget {
  @override
  _PinCreatedSuccessfullyPageState createState() =>
      _PinCreatedSuccessfullyPageState();
}

class _PinCreatedSuccessfullyPageState
    extends State<PinCreatedSuccessfullyPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                "Pin successfully created",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 22.0,
                  letterSpacing: 1.0,
                  color: lightGreen,
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Finally, Would you like to set up your",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 21.0,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "fingerprint ID login",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 21.0,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Image.asset(
                    touchId,
                    height: 80.0,
                    width: 80.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 16.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Theme.of(context).iconTheme.color,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text(
                          "YES",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingWallet()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color,
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text(
                          "SET UP LATER",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              isClicked
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Authenticate",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0,
                                letterSpacing: 1.5,
                                color: Theme.of(context).appBarTheme.color,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    touch,
                                    height: 80.0,
                                    width: 80.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Touch the fingerprint sensor",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                      letterSpacing: 0.7,
                                      color:
                                          Theme.of(context).appBarTheme.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            FlatButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                              child: Text(
                                "CANCEL",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.7,
                                  color: Color(0xFF008877),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}

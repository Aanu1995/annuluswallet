import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/view/screens/new_wallet/pin_page.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/screens/new_wallet/pin_created_successfully.dart';

class RequestPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Would you like to set up a ",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "6 digit PIN?",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 21.0,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 30.0,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              ButtonFilled(
                text: "YES",
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                height: 60.0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PinPage()),
                  );
                },
              ),
              ButtonNotFilled(
                text: "SET UP LATER",
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                height: 60.0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PinCreatedSuccessfullyPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

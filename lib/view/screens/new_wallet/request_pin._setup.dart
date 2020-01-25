import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/view/screens/new_wallet/pin_page.dart';
import 'package:annuluswallet/view/screens/new_wallet/pin_created_successfully.dart';

class RequestPinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Would you like to set up a ",
                style: theme.title.copyWith(
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w300,
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
                    style: theme.title.copyWith(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 28.0,
                    color: Colors.white,
                  )
                ],
              ),
              EmptySpace(multiple: 5.0),
              CustomButton(
                text: "YES",
                onPressed: () => Router.goToWidget(
                  context: context,
                  page: PinPage(),
                ),
              ),
              EmptySpace(multiple: 3.0),
              CustomOutlineButton(
                text: "SET UP LATER",
                onPressed: () => Router.goToWidget(
                  context: context,
                  page: PinCreatedSuccessfullyPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

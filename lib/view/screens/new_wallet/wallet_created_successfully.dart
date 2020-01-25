import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/custom_buttons.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/request_pin._setup.dart';

class WalletCreatedSuccessfullyPage extends StatelessWidget {
  final page;
  WalletCreatedSuccessfullyPage({this.page});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: darkBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Wallet successfully created",
                        style: theme.title.copyWith(
                          color: lightGreen,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      EmptySpace(multiple: 5.0),
                      Image.asset(
                        walletCreated,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                      EmptySpace(multiple: 2.0),
                      Text(
                        "You're all set up Einstein!",
                        style: theme.subhead.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: "LOGIN FOR THE FIRST TIME",
                onPressed: () => Router.goToWidget(
                  context: context,
                  page: page ?? RequestPinPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

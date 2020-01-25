import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/loading_wallet.dart';
import 'package:provider/provider.dart';

class PinCreatedSuccessfullyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: FingerprintPopupProvider(),
      child: _PinCreatedSuccessfullyPage(),
    );
  }
}

class _PinCreatedSuccessfullyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fingerProvider = Provider.of<FingerprintPopupProvider>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Pin successfully created",
                  style: theme.textTheme.title.copyWith(
                    color: theme.iconTheme.color,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
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
                      "Finally, Would you like to set up your fingerprint ID login",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.title.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        height: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    EmptySpace(multiple: 5.0),
                    Image.asset(
                      touchId,
                      height: 60.0,
                      width: 60.0,
                    ),
                    EmptySpace(multiple: 2.5),
                    EmptySpace(multiple: 5.0),
                    CustomButton(
                      text: "YES",
                      onPressed: () => fingerProvider.display(),
                    ),
                    EmptySpace(multiple: 3.0),
                    CustomOutlineButton(
                      text: "SET UP LATER",
                      onPressed: () => Router.goToWidget(
                        context: context,
                        page: LoadingWallet(),
                      ),
                    ),
                    EmptySpace(multiple: 2.5),
                  ],
                ),
                if (fingerProvider.isDisplayed) FingerprintPopup()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

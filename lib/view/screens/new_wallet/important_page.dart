import 'package:flutter/material.dart';

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/components/export_components.dart';

class ImportantPage extends StatelessWidget {
  final String _paragraph1 =
      "Your password is required to unlock your wallet securely. When closing your wallet we will lock and encrypt your wallet safely.";
  final String _paragraph2 =
      "Write down a copy of password (paraphrase) on paper and store it securely.\nIf you lose it, you won't be able to unclock your wallet and you will lose access to your Annulus wallet.";
  final _paragraph3 =
      "A safe and secure passwords will consists of:\n\n1. Capital letters \n2. Special characters \n3. Numbers \n\n\nFor example, \nAnnulus\$WALlet3001!LeT\$DOThi\$!";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(elevation: 0.0, leading: BackArrow()),
      body: Container(
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 30.0),
              child: Text(
                "Before you get started",
                style: theme.primaryTextTheme.title,
              ),
            ),
            EmptySpace(multiple: 3.0),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "IMPORTANT",
                          style: theme.primaryTextTheme.subhead,
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Image.asset(
                            important,
                            height: 28.0,
                            width: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomText(text: _paragraph1),
                  CustomText(text: _paragraph2),
                  CustomText(text: _paragraph3),
                ],
              )),
            ),
            CustomButton(
              text: "GET STARTED",
              onPressed: () => Router.goToScreen(
                context: context,
                page: Routes.CREATEPASSWORDPAGE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

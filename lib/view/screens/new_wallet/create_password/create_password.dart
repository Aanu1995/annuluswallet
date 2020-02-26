import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/view/components/export_components.dart';

import 'components/password_field.dart';

class CreatePasswordPage extends StatelessWidget {
  final String text;
  final page;
  CreatePasswordPage({this.text, this.page});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: InfoDisplayProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: BackArrow(),
        ),
        body: _CreatePasswordPage(text: text, page: page),
      ),
    );
  }
}

class _CreatePasswordPage extends StatelessWidget {
  final String text;
  final page;
  _CreatePasswordPage({this.text, this.page});

  static String _info =
      "Confirm your password by re-entering the password that you have just created in the last step. Yar, tell me about it!";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30.0),
                alignment: Alignment.topLeft,
                child: Text(
                  text ?? "Step 1 of 4",
                  style: theme.primaryTextTheme.title,
                ),
              ),
              Expanded(
                child: const PasswordField(),
              ),
            ],
          ),
        ),
        Consumer<InfoDisplayProvider>(
          builder: (context, infoProvider, child) {
            if (infoProvider.isDisplayed) {
              return ShowCase(
                offset: infoProvider.infoOffset,
                info: _info,
              );
            }
            return Offstage();
          },
        )
      ],
    );
  }
}

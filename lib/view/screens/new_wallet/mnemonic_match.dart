import 'dart:math';

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/mnemonicSelectonBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_match.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_intro.dart';
import 'package:annuluswallet/provider/info_display_provider.dart';

class MnemonicMatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: InfoDisplayProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: BackArrow(),
        ),
        body: _MnemonicMatchPage(),
      ),
    );
  }
}

class _MnemonicMatchPage extends StatefulWidget {
  @override
  __MnemonicMatchPageState createState() => __MnemonicMatchPageState();
}

class __MnemonicMatchPageState extends State<_MnemonicMatchPage> {
  final GlobalKey _infoPopupKey = GlobalKey();
  Offset _infoOffset = Offset(0.0, 0.0);

  String _info =
      "Tap the correct 5 mnemonic phrase words (blue) following the example word shown in (green) to complete the sequence of 6 words.";
  final List list = [];
  int example;

  @override
  void initState() {
    super.initState();
    example = Random().nextInt(18);
    for (int i = 0; i < mnemonicPhrase.length; i++) {
      if (i != example) {
        list.add(mnemonicPhrase[i]);
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _infoPopupKey.currentContext.findRenderObject();
      _infoOffset = infoButton.localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RapidsProvider>(context);
    final theme = Theme.of(context);
    final infoProvider =
        Provider.of<InfoDisplayProvider>(context, listen: false);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 14.0, right: 14.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Step 4 of 4",
                  style: theme.primaryTextTheme.title,
                ),
              ),
              const EmptySpace(multiple: 2.5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      HeaderText(text: "Please confirm the next 5 following"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          HeaderText(text: "sequenced words"),
                          InkWell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(
                                Icons.info_outline,
                                key: _infoPopupKey,
                                size: 28.0,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () => infoProvider.display(),
                          ),
                          HeaderText(text: "of your"),
                        ],
                      ),
                      HeaderText(text: "mnemonic phrase"),
                      const EmptySpace(multiple: 3.8),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            DefaultBox(example: mnemonicPhrase[example]),
                            for (int i = 0;
                                i < provider.getMnemonic.length;
                                i++)
                              MnemonicBox(index: i),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF979797),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      const EmptySpace(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            for (int i = 0; i < list.length; i++)
                              MnemonicListBoxes(name: list[i])
                          ],
                        ),
                      ),
                      const EmptySpace(multiple: 3.0),
                      CustomButton(
                        text: "SUBMIT",
                        onPressed: () => Router.removeWidget(
                          context: context,
                          page: ConfirmMatch(),
                        ),
                      ),
                      const EmptySpace(multiple: 3.8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Consumer<InfoDisplayProvider>(
          builder: (context, infoProvider, child) {
            if (infoProvider.isDisplayed) {
              return ShowCase(
                offset: _infoOffset,
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

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).primaryTextTheme.subhead.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.2,
            height: 1.5,
          ),
    );
  }
}

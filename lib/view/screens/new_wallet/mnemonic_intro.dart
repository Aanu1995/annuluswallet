import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_match.dart';

class MnemonicIntroPage extends StatefulWidget {
  @override
  _MnemonicIntroPageState createState() => _MnemonicIntroPageState();
}

class _MnemonicIntroPageState extends State<MnemonicIntroPage> {
  String recoveryWords = "";
  @override
  void initState() {
    super.initState();
    for (String i in mnemonicPhrase) {
      recoveryWords = recoveryWords + "$i ";
    }
  }

  final String paragraph1 =
      "These mnemonic recovery phrase words are required to restore your wallet.";
  final String paragraph2 =
      "In case your current mobile is unsuable, your 24 mnemonic phrase words will allow you to restore and recover your wallet on another device. If you lose them, you won't be able to restore this wallet and recover your Annulus (RPD).";
  final paragraph3 =
      "Please write down your 24 mnemonic phrase words and keep them very save.";
  final paragraph4 =
      "Please tell me you have securely saved these recovery phrase words?";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clipboard = Provider.of<ClipBoardProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: BackArrow(),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Step 3 of 4",
                    style: theme.primaryTextTheme.title,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
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
                            EmptySpace(multiple: 2.5),
                            CustomText(text: paragraph1),
                            CustomText(text: paragraph2),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Image.asset(
                                mnemonicpphrase,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: CustomText(text: paragraph3),
                            )
                          ],
                        ),
                        EmptySpace(multiple: 2.0),
                        Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(16.0),
                              margin: EdgeInsets.only(left: 8.0, right: 8.0),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                recoveryWords,
                                textAlign: TextAlign.justify,
                                style: theme.primaryTextTheme.title.copyWith(
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                  wordSpacing: 1.0,
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Copy to Clipboard",
                                textAlign: TextAlign.center,
                                style: theme.primaryTextTheme.subhead.copyWith(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              EmptySpace(multiple: 1.5),
                              InkWell(
                                onTap: () => clipboard.setClipboardStatus(
                                    recoveryWords, true),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Theme.of(context).iconTheme.color),
                                  child: Image.asset(
                                    copy2,
                                    height: 30.0,
                                    width: 30.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        EmptySpace(multiple: 2.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: CustomText(text: paragraph4),
                        ),
                        EmptySpace(multiple: 2.0),
                        CustomButton(
                          text: "YES",
                          onPressed: () => Router.goToWidget(
                            context: context,
                            page: MnemonicMatchPage(),
                          ),
                        ),
                        EmptySpace(multiple: 2.5),
                        CustomButton(text: "NO", onPressed: () {}),
                        EmptySpace(multiple: 2.0),
                      ],
                    ),
                  ),
                ),
              ],
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

List<String> mnemonicPhrase = [
  "index",
  "antique",
  "program",
  "neglect",
  "close",
  "profit",
  "disease",
  "equip",
  "alley",
  "skirt",
  "enough",
  "donkey",
  "rifle",
  "happy",
  "whip",
  "response",
  "toss",
  "play",
  "verify",
  "hat",
  "style",
  "grant",
  "dog",
  "cat",
];

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_match.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:annuluswallet/view/screens/main/login_screen.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_match.dart';
import 'package:annuluswallet/view/screens/new_wallet/loading_wallet.dart';
import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_intro.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';
import 'package:annuluswallet/view/screens/new_wallet/wallet_created_successfully.dart';
import 'package:annuluswallet/view/components/mnemonicSelectonBox.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_password/confirm_password.dart';
import 'package:annuluswallet/view/screens/new_wallet/create_password/create_password.dart';

class RestoreMnemonicMatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: InfoDisplayProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: BackArrow(),
        ),
        body: _RestoreMnemonicMatchPage(),
      ),
    );
  }
}

class _RestoreMnemonicMatchPage extends StatefulWidget {
  @override
  __RestoreMnemonicMatchPageState createState() =>
      __RestoreMnemonicMatchPageState();
}

class __RestoreMnemonicMatchPageState extends State<_RestoreMnemonicMatchPage> {
  Offset infoContainer = Offset(0.0, 0.0);
  final GlobalKey _infoPopupKey = GlobalKey();
  String _info =
      "Tap the correct 24 mnemonic phrase words (blue) following the example word shown in (green) to complete the sequence.";
  final List list = [];
  int example;
  @override
  void initState() {
    super.initState();
    example = 0;
    for (int i = 0; i < mnemonicPhrase.length; i++) {
      if (i != example) {
        list.add(mnemonicPhrase[i]);
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _infoPopupKey.currentContext.findRenderObject();
      infoContainer = infoButton.localToGlobal(Offset.zero);
      print(infoContainer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<RapidsProvider>(context);
    final infoProvider =
        Provider.of<InfoDisplayProvider>(context, listen: false);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Step 1 of 3",
                  style: theme.primaryTextTheme.title,
                ),
              ),
              const EmptySpace(multiple: 2.5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      HeaderText(text: "Please confirm your 24 phrase"),
                      HeaderText(text: "words following sequenced words"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          HeaderText(text: "of your mnemonic phrase "),
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
                        ],
                      ),
                      const EmptySpace(multiple: 3.8),
                      Container(
                        alignment: Alignment.topLeft,
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
                              MnemonicBox(index: i, restore: true),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF979797),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      const EmptySpace(multiple: 2.5),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            for (int i = 0; i < list.length; i++)
                              MnemonicListBoxes(name: list[i], restore: true)
                          ],
                        ),
                      ),
                      const EmptySpace(multiple: 1.25),
                      if (provider.getMnemonic.length == 23)
                        CustomOutlineButton(
                          text: "CLEAR ALL",
                          onPressed: () => provider.setMnemonicEmpty = true,
                        ),
                      const EmptySpace(multiple: 3.0),
                      CustomButton(
                        text: "SUBMIT",
                        onPressed: () => Router.removeWidget(
                          context: context,
                          page: ConfirmMatch(
                            page: WalletKeyCreationSuccessful(
                              page: CreatePasswordPage(
                                text: "Step 2 of 3",
                                page: ConfirmPasswordPage(
                                  text: "Step 3 of 3",
                                  page: MicroLoading(
                                    page: WalletCreatedSuccessfullyPage(
                                      page: LoginScreen(
                                        page: LoadingWallet(
                                          page: DashBoardPage(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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

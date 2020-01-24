import 'package:annuluswallet/view/screens/new_wallet/create_password/create_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:annuluswallet/view/screens/main/login_screen.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_match.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_password.dart';
import 'package:annuluswallet/view/screens/new_wallet/loading_wallet.dart';
import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_intro.dart';
import 'package:annuluswallet/view/screens/new_wallet/successfully_created_wallet_key.dart';
import 'package:annuluswallet/view/screens/new_wallet/wallet_created_successfully.dart';
import 'package:annuluswallet/view/screens/showcase/showcase.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/mnemonicSelectonBox.dart';

class RestoreMnemonicMatchPage extends StatefulWidget {
  @override
  _RestoreMnemonicMatchPageState createState() =>
      _RestoreMnemonicMatchPageState();
}

class _RestoreMnemonicMatchPageState extends State<RestoreMnemonicMatchPage> {
  bool isDialog = false;
  Offset infoContainer = Offset(0.0, 0.0);
  final GlobalKey _two = GlobalKey();
  String description =
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
      RenderBox infoButton = _two.currentContext.findRenderObject();
      infoContainer = infoButton.localToGlobal(Offset.zero);
      print(infoContainer);
    });
  }

  @override
  Widget build(BuildContext context) {
    RapidsProvider rapidsProvider = Provider.of<RapidsProvider>(context);
    return WillPopScope(
        onWillPop: () {
          rapidsProvider.setExitSetUp = true;
          return;
        },
        child: Stack(
          children: <Widget>[
            Scaffold(
              appBar: newWalletAppBar2(context, height: 60.0, onTap: () {
                rapidsProvider.setExitSetUp = true;
              }),
              body: Consumer<RapidsProvider>(
                builder: (context, provider, child) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 14.0, right: 14.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 16.0),
                              child: Text(
                                "Step 1 of 3",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                  color: Theme.of(context).iconTheme.color,
                                ),
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
                                    Text(
                                      "Please confirm your 24 phrase",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "words following sequenced words",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "of your mnemonic phrase ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 20.0,
                                            letterSpacing: 1.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          key: _two,
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isDialog = true;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(8.0),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        alignment: WrapAlignment.start,
                                        children: <Widget>[
                                          DefaultBox(
                                              example: mnemonicPhrase[example]),
                                          for (int i = 0;
                                              i < provider.getMnemonic.length;
                                              i++)
                                            MnemonicBox(
                                                index: i, restore: true),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFF979797),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: 10.0, top: 10.0),
                                        child: Text(
                                          provider.getMnemonic.length == 23
                                              ? "All words selected"
                                              : "Select ${23 - provider.getMnemonic.length} words",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.0,
                                            letterSpacing: 1.0,
                                            height: 1.4,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        alignment: WrapAlignment.start,
                                        children: <Widget>[
                                          for (int i = 0; i < list.length; i++)
                                            MnemonicListBoxes(
                                                name: list[i], restore: true)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    provider.isValidate
                                        ? Container()
                                        : Text(
                                            "Those 23 words didn't match. Try again",
                                            style: TextStyle(
                                                color: Color(0xFFf55d7f),
                                                fontSize: 17.0),
                                          ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    if (provider.getMnemonic.length == 23)
                                      ButtonNotFilled(
                                        text: "CLEAR ALL",
                                        height: 60.0,
                                        margin: EdgeInsets.all(0.0),
                                        onTap: () {
                                          provider.setMnemonicEmpty = true;
                                        },
                                      ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        ButtonFilled(
                                          text: "SUBMIT",
                                          height: 60.0,
                                          margin: EdgeInsets.all(0.0),
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ConfirmMatch(
                                                          provider: provider,
                                                          page:
                                                              WalletKeyCreationSuccessful(
                                                            page:
                                                                CreatePasswordPage(
                                                              text:
                                                                  "Step 2 of 3",
                                                              page:
                                                                  ConfirmPasswordPage(
                                                                text:
                                                                    "Step 3 of 3",
                                                                page:
                                                                    MicroLoading(
                                                                  page:
                                                                      WalletCreatedSuccessfullyPage(
                                                                    page:
                                                                        LoginScreen(
                                                                      page:
                                                                          LoadingWallet(
                                                                        page:
                                                                            DashBoardPage(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )));
                                          },
                                        ),
                                        if (provider.getMnemonic.length < 23)
                                          Container(
                                            color: Colors.black54,
                                            height: 60,
                                          )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (provider.isExitSetUp) Exit()
                    ],
                  );
                },
              ),
            ),
            if (isDialog)
              ShowCase(
                description: description,
                infoContainer: infoContainer,
                onTap: () {
                  setState(() {
                    isDialog = false;
                  });
                },
              )
          ],
        ));
  }
}

class Exit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rapidsProvider = Provider.of<RapidsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 1.0,
          ),
          child: Container(
            child: Card(
              elevation: 10.0,
              color: Color(0xFFeeeeee),
              child: Container(
                height: (MediaQuery.of(context).size.width) <
                        (MediaQuery.of(context).size.height)
                    ? (MediaQuery.of(context).size.width / 2.2)
                    : (MediaQuery.of(context).size.height / 2.2),
                padding: EdgeInsets.only(
                    top: 30.0, bottom: 16.0, left: 16.0, right: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hey you're exiting Setup?",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      "Any new wallet selections will be lost",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFFff5722),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            rapidsProvider.setExitSetUp = false;
                          },
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        FlatButton(
                          child: Text(
                            "CONFIRM",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFFff5722),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            rapidsProvider.setExitSetUp = false;
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

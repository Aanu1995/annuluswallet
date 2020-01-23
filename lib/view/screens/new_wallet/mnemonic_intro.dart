import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/controller/app_function.dart';
import 'package:annuluswallet/model/data.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/new_wallet/mnemonic_match.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: newWalletAppBar2(context, height: 60.0),
        body: Consumer<RapidsProvider>(
          builder: (context, clipboard, child) {
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
                          "Step 3 of 4",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "IMPORTANT",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 20.0,
                                            letterSpacing: 1.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Image.asset(
                                          important,
                                          height: 30.0,
                                          width: 30.0,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      child: Text(
                                        paragraph1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                          letterSpacing: 1.0,
                                          height: 1.4,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      child: Text(
                                        paragraph2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15.0,
                                          letterSpacing: 1.0,
                                          height: 1.4,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        paragraph3,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                          letterSpacing: 1.0,
                                          height: 1.4,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  mnemonicpphrase,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                height: 260.0,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 30.0),
                                      margin: EdgeInsets.only(
                                          left: 2.0, right: 2.0),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        recoveryWords,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            height: 2.0,
                                            wordSpacing: 6.0,
                                            color: Colors.white),
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
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "Copy to Clipboard",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                          letterSpacing: 1.0,
                                          height: 1.4,
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AppFunction().copyClipboard(
                                            recoveryWords, clipboard);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color),
                                        child: Image.asset(
                                          copy2,
                                          height: 30.0,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(left: 16.0, right: 16.0),
                                child: Text(
                                  paragraph4,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    letterSpacing: 1.0,
                                    height: 1.4,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              ButtonFilled(
                                text: "YES",
                                margin: EdgeInsets.all(0.0),
                                fontSize: 18.0,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MnemonicMatchPage()));
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ButtonNotFilled(
                                text: "No",
                                margin: EdgeInsets.all(0.0),
                                fontSize: 18.0,
                                onTap: () {},
                              ),
                              SizedBox(
                                height: 30.0,
                              )
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
            );
          },
        ));
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

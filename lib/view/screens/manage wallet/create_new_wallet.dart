import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/loading%20screen/create_wallet_loading.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';

class CreateNewWallet extends StatefulWidget {
  CreateNewWallet({Key key}) : super(key: key);

  _CreateNewWalletState createState() => _CreateNewWalletState();
}

class _CreateNewWalletState extends State<CreateNewWallet> {
  TextEditingController _controller = TextEditingController();
  FocusNode labelFocus = FocusNode();
  bool isLabelFocus = false;

  @override
  void initState() {
    super.initState();
    labelFocus.addListener(() {
      isLabelFocus = labelFocus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingProvider>(
        builder: (context, loadingProvider, child) {
      return Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.white,
            appBar: RapidAppBarBackButton(
                preContext: context, appTitle: "Manage Wallets"),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "CREATE MY NEW WALLET",
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (isLabelFocus)
                          Text(
                            "Enter your wallet name",
                            style: TextStyle(
                              fontSize: 13.0,
                              letterSpacing: 2.0,
                              color: Colors.black,
                            ),
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Theme(
                          data: ThemeData(
                              primaryColor: _controller.text.isNotEmpty &&
                                      _controller.text.length < 5
                                  ? Color(0xFFf55d7f)
                                  : Theme.of(context).iconTheme.color),
                          child: TextField(
                            controller: _controller,
                            focusNode: labelFocus,
                            cursorColor: Theme.of(context).iconTheme.color,
                            inputFormatters: [
                              WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))
                            ],
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 18.0,
                              letterSpacing: 1.0,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusColor: Theme.of(context).iconTheme.color,
                              hintText: "Enter your wallet name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: 1.0),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                            onSubmitted: (val) => createWalletButton(),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _controller.text.isNotEmpty && _controller.text.length < 5
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "Sorry, a name must be more than 4 characters",
                                style: TextStyle(color: Colors.pinkAccent),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        )
                      : Container(),
                  ButtonFilled(
                    text: "CREATE WALLET",
                    color: Theme.of(context)
                        .iconTheme
                        .color
                        .withOpacity(_controller.text.length < 5 ? 0.3 : 1),
                    height: 50.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    onTap: () => createWalletButton(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          if (loadingProvider.isLoading) LoadingCreatedWallet(),
        ],
      );
    });
  }

  createWalletButton() async {
    LoadingProvider loadingProvider = Provider.of<LoadingProvider>(context);
    if (_controller.text.length > 5) {}
  }
}

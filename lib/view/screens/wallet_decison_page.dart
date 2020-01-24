import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:annuluswallet/view/screens/restore_wallet/restore_mnemonic_match.dart';
import 'package:annuluswallet/view/widget/routes.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:provider/provider.dart';

class WalletDecisionPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider.value(
      value: InfoDisplayProvider(),
      child: Scaffold(
        key: _globalKey,
        appBar: PreferredSize(
          preferredSize: Size(size.width, 80),
          child: AppBarDrawerLogo(globalKey: _globalKey),
        ),
        body: _DecisionPage(),
        floatingActionButton: VersionTypeText(),
        drawer: UnAuthenticatedDrawer(),
      ),
    );
  }
}

class _DecisionPage extends StatefulWidget {
  @override
  __DecisionPageState createState() => __DecisionPageState();
}

class __DecisionPageState extends State<_DecisionPage> {
  final GlobalKey _infoPopupKey = GlobalKey();
  Offset _infoOffset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _infoPopupKey.currentContext.findRenderObject();
      _infoOffset = infoButton.localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    final infoProvider = Provider.of<InfoDisplayProvider>(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Image.asset(
                  bikes,
                ),
              ),
            ),
            EmptySpace(multiple: 2.0),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomButton(
                      text: "CREATE A NEW WALLET",
                      onPressed: () => Router.goToScreen(
                        context: context,
                        page: Routes.TERMSPAGE,
                      ),
                    ),
                    EmptySpace(multiple: 2.0),
                    CustomButton(
                      text: "RESTORE A WALLET",
                      onPressed: () => pushAndRemoveUntil(
                        context: context,
                        page: MicroLoading(
                          text: "Welcome back...",
                          page: RestoreMnemonicMatchPage(),
                        ),
                      ),
                    ),
                    EmptySpace(multiple: 3.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "MORE INFO ",
                          style: primaryTextTheme.subtitle,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.info_outline,
                            key: _infoPopupKey,
                            size: 30.0,
                          ),
                          onTap: () => infoProvider.display(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        infoProvider.isDisplayed
            ? InfoPopup(
                offset: _infoOffset,
              )
            : Offstage()
      ],
    );
  }
}

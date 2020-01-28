import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/widget/routes.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/screens/restore_wallet/restore_mnemonic_match.dart';
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

class _DecisionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () => Router.goToWidget(
                        context: context,
                        page: MicroLoading(
                          text: "Welcome back...",
                          page: RestoreMnemonicMatchPage(),
                        ),
                      ),
                    ),
                    EmptySpace(multiple: 3.0),
                    const _Information(),
                  ],
                ),
              ),
            ),
          ],
        ),
        Consumer<InfoDisplayProvider>(
          builder: (context, infoProvider, child) {
            if (infoProvider.isDisplayed) {
              return InfoPopup(
                offset: infoProvider.infoOffset,
              );
            }
            return Offstage();
          },
        )
      ],
    );
  }
}

class _Information extends StatefulWidget {
  const _Information({Key key}) : super(key: key);

  @override
  __InformationState createState() => __InformationState();
}

class __InformationState extends State<_Information> {
  final GlobalKey _infoPopupKey = GlobalKey();
  InfoDisplayProvider infoProvider;
  @override
  void initState() {
    super.initState();
    infoProvider = Provider.of<InfoDisplayProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _infoPopupKey.currentContext.findRenderObject();
      infoProvider.setOffset = infoButton.localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Row(
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
    );
  }
}

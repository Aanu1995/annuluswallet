import 'package:annuluswallet/view/screens/new_wallet/mnemonic_match.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:annuluswallet/provider/base_provider.dart';
import 'package:annuluswallet/view/utils/color_utils.dart';
import 'package:annuluswallet/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return BaseProvider(
      child: MaterialApp(
        title: 'Annulus',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorUtils.PRIMARY_COLOR,
          accentColor: ColorUtils.ACCENT_COLOR,
          appBarTheme: AppBarTheme(
            color: ColorUtils.APPBAR_COLOR,
            iconTheme: IconThemeData(
              color: ColorUtils.ICON_COLOR,
              size: 35.0,
            ),
          ),
          scaffoldBackgroundColor: ColorUtils.APPBAR_COLOR,
          primaryIconTheme: IconThemeData(
            color: ColorUtils.ICON_COLOR,
          ),
          iconTheme: IconThemeData(
            color: ColorUtils.ICON_COLOR,
            size: 35.0,
          ),
          primaryTextTheme: TextTheme(
            title: TextStyle(
              fontSize: 18.0,
              color: ColorUtils.ICON_COLOR,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: ColorUtils.BOTTOM_APPBAR_COLOR,
          ),
        ),
        home: MnemonicMatchPage(),
        //routes: Routes.getRoutes,
      ),
    );
  }
}

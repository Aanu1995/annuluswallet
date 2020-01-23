import 'package:annuluswallet/view/screens/new_wallet/create_password.dart';
import 'package:annuluswallet/view/screens/new_wallet/important_page.dart';
import 'package:annuluswallet/view/screens/wallet_decison_page.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/view/screens/splash_page.dart';
import 'package:annuluswallet/view/screens/new_wallet/terms_page.dart';

class Routes {
  static const String SPLASHPAGE = "/";
  static const String WALLETDECISIONPAGE = "/walletdecisionpage";
  static const String TERMSPAGE = "/termspage";
  static const String IMPORTPAGE = "/importpage";
  static const String CREATEPASSWORDPAGE = "/createpasswordpage";

  static Map<String, Widget Function(BuildContext)> get getRoutes => {
        SPLASHPAGE: (BuildContext context) => SplashPage(),
        WALLETDECISIONPAGE: (BuildContext context) => WalletDecisionPage(),
        TERMSPAGE: (BuildContext context) => TermsPage(),
        IMPORTPAGE: (BuildContext context) => ImportantPage(),
        CREATEPASSWORDPAGE: (BuildContext context) => CreatePasswordPage(),
      };
}

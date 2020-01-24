import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/provider/dataProvider,.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:provider/provider.dart';

class BaseProvider extends StatelessWidget {
  final Widget child;
  const BaseProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomAppBarProvider>.value(
          value: BottomAppBarProvider(),
        ),
        ChangeNotifierProvider<WalletDetailProvider>.value(
          value: WalletDetailProvider(),
        ),
        ChangeNotifierProvider<WalletDetailsBottomAppBarProvider>.value(
          value: WalletDetailsBottomAppBarProvider(),
        ),
        ChangeNotifierProvider<TransactionBottomAppBarProvider>.value(
          value: TransactionBottomAppBarProvider(),
        ),
        Provider<DashboardProvider>.value(
          value: DashboardProvider(),
        ),
        ChangeNotifierProvider<WalletDataProvider>.value(
          value: WalletDataProvider(),
        ),
        ChangeNotifierProvider<RapidsProvider>.value(
          value: RapidsProvider(),
        ),
        ChangeNotifierProvider<LoadingProvider>.value(
          value: LoadingProvider(),
        ),
        ChangeNotifierProvider<ClipBoardProvider>.value(
          value: ClipBoardProvider(),
        ),
      ],
      child: child,
    );
  }
}

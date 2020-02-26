import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Wallet {
  String walletType;
  double amount;
  String id;
  String formattedAmount;

  Wallet(this.walletType, this.amount, this.id) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: amount);
    this.formattedAmount = fmf.output.nonSymbol;
  }
}

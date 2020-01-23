import 'package:flutter/foundation.dart';

class WalletDataProvider with ChangeNotifier {
  double _balance = 0.00;
  double get getBalance => _balance;
  set setBalance(double balance) {
    _balance = balance;
    notifyListeners();
  }
}

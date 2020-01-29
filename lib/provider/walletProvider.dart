import 'package:flutter/material.dart';

class DashboardProvider {
  int _selectedIndex = 1; //This is to know the selected item in the drawer

  int get selectedItem =>
      _selectedIndex; //This gets the selected index in the drawer
  set setIndex(int index) {
    _selectedIndex = index;
  }
}

class TransactionBottomAppBarProvider with ChangeNotifier {
  int _selectedIndex =
      1; //This is to know the selected item in the bottomAppBar

  TabController _tabController;

  TabController get tabController =>
      _tabController; // This is used to get the controller

  set setTabController(TabController control) {
    _tabController = control;
  }

  int get selectedItem =>
      _selectedIndex; //This gets the selected index in the drawer
  set setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class WalletDetailsBottomAppBarProvider with ChangeNotifier {
  int _selectedIndex =
      1; //This is to know the selected item in the bottomAppBar

  int get selectedItem =>
      _selectedIndex; //This gets the selected index in the drawer
  set setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class RapidsProvider with ChangeNotifier {
  // This is for mnemonic phrase words

  List<String> _mnemonic = [];
  List<String> get getMnemonic => _mnemonic;
  set addMnemonic(String val) {
    _mnemonic.add(val);
    notifyListeners();
  }

  set removeMnemonic(String val) {
    _mnemonic.remove(val);
    notifyListeners();
  }

  set setMnemonicEmpty(bool) {
    _mnemonic = [];
    notifyListeners();
  }

  bool _isValidate = true;
  bool get isValidate => _isValidate;
  set setValidateStatus(bool value) {
    _isValidate = value;
  }
}

class WalletDetailProvider with ChangeNotifier {
  String _walletId = "";
  String get getWalletId => _walletId;
  set setWalletId(String id) {
    _walletId = id;
    notifyListeners();
  }
}

class LoadingProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setLoadingStatus(bool load) {
    _isLoading = load;
    notifyListeners();
  }
}

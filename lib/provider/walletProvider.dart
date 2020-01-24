import 'package:flutter/material.dart';

class DashboardProvider {
  int _selectedIndex = 1; //This is to know the selected item in the drawer

  int get selectedItem =>
      _selectedIndex; //This gets the selected index in the drawer
  set setIndex(int index) {
    _selectedIndex = index;
  }
}

// This class is created to be able to change the inex of the bottomAppBar
class BottomAppBarProvider with ChangeNotifier {
  bool _showDialog = false;
  bool get getDialogStatus =>
      _showDialog; // this is use to check if the dialog is true or not
  set setDialogStatus(bool value) {
    _showDialog = value;
    notifyListeners();
  }

  int _selectedIndex =
      0; //This is to know the selected item in the bottomAppBar
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

  bool _exitSetup =
      false; // This checks if the user is exiting setup while selecting mnemonic phrase words
  bool get isExitSetUp => _exitSetup;
  set setExitSetUp(bool value) {
    _exitSetup = value;
    notifyListeners();
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

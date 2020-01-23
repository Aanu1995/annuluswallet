import 'package:flutter/material.dart';

class InfoDisplayProvider with ChangeNotifier {
  bool _isDisplayed = false;
  bool get isDisplayed => _isDisplayed;
  void display() {
    _isDisplayed = !_isDisplayed;
    notifyListeners();
  }
}

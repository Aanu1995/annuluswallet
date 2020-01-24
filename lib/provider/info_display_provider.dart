import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';

class InfoDisplayProvider with ChangeNotifier {
  bool _isDisplayed = false;
  bool get isDisplayed => _isDisplayed;
  void display() {
    _isDisplayed = !_isDisplayed;
    notifyListeners();
  }
}

class FingerprintPopupProvider with ChangeNotifier {
  bool _isDisplayed = false;
  bool get isDisplayed => _isDisplayed;
  void display() {
    _isDisplayed = !_isDisplayed;
    notifyListeners();
  }
}

class ClipBoardProvider with ChangeNotifier {
  bool _clipBoard = false;
  bool get getClipboardStatus =>
      _clipBoard; // this is use to check if the dialog is true or not
  setClipboardStatus(String text, bool value) {
    if (value == true) {
      ClipboardManager.copyToClipBoard(text).then((result) {
        _clipBoard = true;
        notifyListeners();
        return;
      });
    }
    _clipBoard = value;
    notifyListeners();
  }
}

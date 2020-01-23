import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:annuluswallet/provider/walletProvider.dart';

class AppFunction {
  //This widget is called to copy to the clipboard
  copyClipboard(String text, RapidsProvider clipboard) {
    ClipboardManager.copyToClipBoard(text).then((result) {
      clipboard.setClipboardStatus = true;
      Future.delayed(Duration(seconds: 3)).then((_) {
        clipboard.setClipboardStatus = false;
      });
    });
  }
}

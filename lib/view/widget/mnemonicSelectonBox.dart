import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/provider/walletProvider.dart';

class MnemonicBox extends StatelessWidget {
  final int index;
  final bool restore;
  MnemonicBox({this.index, this.restore = false});
  @override
  Widget build(BuildContext context) {
    RapidsProvider provider = Provider.of<RapidsProvider>(context);
    return Container(
        height: 40.0,
        width: 90.0,
        margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0, bottom: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: restore ? Colors.green : Color(0xFF088c99),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  provider.getMnemonic[index],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 20.0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                onPressed: () {
                  provider.removeMnemonic = provider.getMnemonic[index];
                },
              )
            ],
          ),
        ));
  }
}

class MnemonicListBoxes extends StatelessWidget {
  final String name;
  final bool restore;
  MnemonicListBoxes({this.name, this.restore = false});
  @override
  Widget build(BuildContext context) {
    RapidsProvider provider = Provider.of<RapidsProvider>(context);
    return Builder(
      builder: (context) {
        bool hide = false;
        if (provider.getMnemonic.contains(name)) {
          hide = true;
        }
        if (hide) {
          return Container(
            height: 40.0,
            width: 80.0,
            color: Colors.transparent,
          );
        } else {
          return GestureDetector(
            onTap: () {
              if (restore) {
                provider.addMnemonic = name;
              } else {
                if (provider.getMnemonic.length < 5) {
                  provider.addMnemonic = name;
                }
              }
            },
            child: Container(
              height: 40.0,
              width: 80.0,
              margin: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF088c99),
              ),
              child: Container(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class DefaultBox extends StatelessWidget {
  final String example;
  DefaultBox({this.example});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 90.0,
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 8.0, bottom: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).iconTheme.color,
      ),
      child: Text(
        example,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

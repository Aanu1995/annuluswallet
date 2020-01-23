import 'package:flutter/material.dart';

class AppDialogs {
  static showPermissionRationale(
      {BuildContext context, String tit, String content, String reason}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              tit,
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              "$content \n\n$reason",
              style: TextStyle(fontSize: 18.0),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'DENY',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  'ALLOW',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop("ALLOW");
                },
              ),
            ],
          );
        });
  }
}

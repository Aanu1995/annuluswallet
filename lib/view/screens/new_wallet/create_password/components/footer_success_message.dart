import 'package:flutter/material.dart';

class FooterSuccessMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Text(
        "Remember to write down this password, encrypt it and store it securely!",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, height: 1.5, letterSpacing: 1.5),
      ),
    );
  }
}

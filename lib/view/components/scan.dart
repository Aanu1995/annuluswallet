// This widget is used to display the button in the clipboard and share
import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  final String title;
  final Function onTap;
  Scan({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlineButton(
        color: Colors.transparent,
        borderSide: BorderSide(color: Theme.of(context).iconTheme.color),
        shape: StadiumBorder(),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Theme.of(context).iconTheme.color),
        ),
        onPressed: onTap,
      ),
    );
  }
}

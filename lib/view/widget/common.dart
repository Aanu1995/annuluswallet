import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class ButtonFilled extends StatelessWidget {
  final String text;
  final Function onTap;
  final double fontSize;
  final double letterSpacing;
  final double height;
  final EdgeInsets margin;
  final Color color;
  ButtonFilled(
      {@required this.text,
      @required this.onTap,
      this.height,
      this.fontSize,
      this.margin,
      this.color,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ??
            EdgeInsets.only(top: 30.0, bottom: 10.0, left: 8.0, right: 8.0),
        height: height ?? 60.0,
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).iconTheme.color,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize ?? 16.0,
              letterSpacing: letterSpacing ?? 2.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonNotFilled extends StatelessWidget {
  final String text;
  final Function onTap;
  final double fontSize;
  final double height;
  final EdgeInsets margin;
  ButtonNotFilled({
    @required this.text,
    @required this.onTap,
    this.fontSize,
    this.height,
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height ?? 60.0,
        margin: margin ?? EdgeInsets.only(left: 8.0, right: 8.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).iconTheme.color, width: 2.0),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? 16.0,
                color: Theme.of(context).iconTheme.color),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

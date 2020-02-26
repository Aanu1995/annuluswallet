import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  final String text;
  HeadText({this.text});
  final Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        text ?? "FROM ADDRESS",
        style: Theme.of(context).textTheme.subhead.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

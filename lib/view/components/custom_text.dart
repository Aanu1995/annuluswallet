import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({this.text});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: theme.primaryTextTheme.subtitle.copyWith(
          height: 1.5,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

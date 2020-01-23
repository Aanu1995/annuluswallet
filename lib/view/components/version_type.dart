import 'package:flutter/material.dart';

class VersionTypeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "V1.0.1",
      style: Theme.of(context).primaryTextTheme.caption,
    );
  }
}

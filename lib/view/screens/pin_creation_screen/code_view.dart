import 'package:flutter/material.dart';
import 'dart:core';

class CodeView extends StatefulWidget {
  CodeView({this.code, this.length = 6, this.codeTextStyle, this.obscurePin});
  final String code;
  final int length;
  final bool obscurePin;
  final TextStyle codeTextStyle;

  CodeViewState createState() => CodeViewState();
}

class CodeViewState extends State<CodeView> {
  Color getCodeAt(index) {
    if (widget.code == null || widget.code.length < index)
      return Color(0xFFbababa);
    else if (widget.obscurePin) {
      return Theme.of(context).iconTheme.color;
    } else {
      return Theme.of(context).iconTheme.color;
    }
  }

  _getCodeViews() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.length; i++) {
      widgets.add(
        Container(
            margin: EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: getCodeAt(i + 1),
            )),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _getCodeViews(),
    );
  }
}

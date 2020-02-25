import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  const CustomButton({Key key, this.text, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.maxFinite,
      height: 45.0,
      child: RaisedButton(
        color: color ?? theme.iconTheme.color,
        shape: StadiumBorder(),
        child: Text(
          text,
          style: theme.primaryTextTheme.button,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  const CustomOutlineButton({Key key, this.text, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.maxFinite,
      height: 45.0,
      child: OutlineButton(
        color: Colors.transparent,
        borderSide: BorderSide(color: Theme.of(context).iconTheme.color),
        shape: StadiumBorder(),
        child: Text(
          text,
          style: theme.primaryTextTheme.button.copyWith(color: color),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

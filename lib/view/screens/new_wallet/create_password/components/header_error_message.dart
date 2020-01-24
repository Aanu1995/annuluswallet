import 'package:flutter/material.dart';

class HeaderErrorMessage extends StatelessWidget {
  final bool confirmPassword;
  const HeaderErrorMessage({this.confirmPassword = false});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        confirmPassword
            ? "Password doesn't match please try again"
            : "Invalid password. please try again",
        style: theme.subhead.copyWith(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}

class FooterErrorMessage extends StatelessWidget {
  final bool confirmPassword;
  const FooterErrorMessage({this.confirmPassword = false});

  final String incrorrectPassword =
      "Please create a password that contains Capital letters, Symbols and Numbers, and must be more than 8 characters in length.";
  final String sample = "For example: \nRapiD\$WALlet3001!LeT\$DOThi\$!";
  final String confirmPasswordError =
      "Please ensure that the password is an exact match and that you saved it! \nHint: Select \'SHOW\' to view your password before  submitting or select back and start over, oh boy!";

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).primaryTextTheme.subtitle.copyWith(
          color: Colors.redAccent,
          height: 1.5,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w400,
        );
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            confirmPassword ? confirmPasswordError : incrorrectPassword,
            textAlign: TextAlign.justify,
            style: style,
          ),
          SizedBox(height: 20.0),
          Text(sample, style: style)
        ],
      ),
    );
  }
}

class PasswordLengthMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Password Length is ",
              style: theme.subtitle.copyWith(
                color: Colors.white,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: "too short",
              style: theme.subtitle.copyWith(
                color: Colors.redAccent,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PasswordValidatorMessage extends StatelessWidget {
  final int message;
  PasswordValidatorMessage({this.message});

  final subMessage = ["whack", "not cool", "just okay", "just solid good"];
  final color = [
    Colors.red,
    Colors.yellow,
    Colors.greenAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 12.0, top: 16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Password Strength is ",
              style: theme.subtitle.copyWith(
                color: Colors.white,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: subMessage[message],
              style: theme.subtitle.copyWith(
                color: color[message],
                letterSpacing: 1.2,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmptyFieldMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryTextTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        "Password fields can not be empty",
        style: theme.subhead.copyWith(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}

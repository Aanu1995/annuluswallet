import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/info.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_password/confirm_password.dart';
import 'package:flutter/material.dart';

import 'footer_success_message.dart';
import 'header_error_message.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final passwordController = TextEditingController();

  bool isVisible = true; // password field visibility status
  bool isValidate; // password validator status

// this returns true if passwpord length is greater than 8
  bool passwordLengthStatus = false;
// this returns -1 if password is not correct
  int passwordState = -1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var color = isValidate == true || isValidate == null
        ? theme.iconTheme.color
        : Colors.red;
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const EmptySpace(multiple: 4.0),
                const Information(text: "Create your password"),
                const EmptySpace(multiple: 3.0),
                if (passwordState != -1 && isValidate == false)
                  HeaderErrorMessage(),
                TextField(
                  controller: passwordController,
                  obscureText: isVisible,
                  cursorColor: Colors.white,
                  style: theme.primaryTextTheme.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      child: Image.asset(
                        isVisible ? show : showOff,
                        height: 25.0,
                        width: 25.0,
                        color: color,
                      ),
                      onTap: () => setState(() {
                        isVisible = !isVisible;
                      }),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: color,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: color,
                      ),
                    ),
                    labelText: "Enter your password",
                    labelStyle: theme.primaryTextTheme.subhead.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) => validation(value),
                ),
                if (passwordState != -1)
                  PasswordValidatorMessage(message: passwordState),
                if (passwordState != -1 && !passwordLengthStatus)
                  PasswordLengthMessage(),
              ],
            ),
          ),
        ),
        if (isValidate == false) FooterErrorMessage(),
        if (passwordState == 3) FooterSuccessMessage(),
        CustomButton(text: "NEXT", onPressed: onPressed),
      ],
    );
  }

  void onPressed() {
    if (passwordState == 3) {
      String password = passwordController.text;
      Router.goToWidget(
        context: context,
        page: ConfirmPasswordPage(password: password),
      );
      return;
    }
    isValidate = false;
    setState(() {});
  }

  validation(String password) {
    RegExp isUpperCase = RegExp(r'[A-Z]+');
    RegExp isNumber = RegExp(r'[0-9]+');
    RegExp isSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]+');
    bool upper = false;
    bool symbol = false;
    bool number = false;
    if (password.length > 8) {
      passwordLengthStatus = true;
    } else {
      passwordLengthStatus = false;
    }
    if (isUpperCase.hasMatch(password)) {
      upper = true;
    } else {
      upper = false;
    }
    if (isNumber.hasMatch(password)) {
      number = true;
    } else {
      number = false;
    }
    if (isSpecial.hasMatch(password)) {
      symbol = true;
    } else {
      symbol = false;
    }

    if (!upper && !symbol && !number) {
      passwordState = 0;
    }
    if (upper || symbol || number && passwordLengthStatus) {
      passwordState = 1;
    }
    if ((upper && symbol) ||
        (upper & number) ||
        (symbol && number) && passwordLengthStatus) {
      passwordState = 2;
    }
    if (upper && symbol && number && passwordLengthStatus) {
      passwordState = 3;
    }
    setState(() {
      isValidate = null;
    });
  }
}

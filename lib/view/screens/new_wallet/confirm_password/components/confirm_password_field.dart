import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/info.dart';
import 'package:annuluswallet/view/screens/new_wallet/create_password/components/header_error_message.dart';
import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  final String password;
  final Widget page;
  const ConfirmPasswordField({Key key, this.password, this.page})
      : super(key: key);

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  final passwordController = TextEditingController();

  bool isVisible = true; // password field visibility status
  bool isValidate; // password validator status

// this returns true if passwpord length is greater than 8
  bool passwordLengthStatus = false;
// this returns -1 if password is not correct

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
                SizedBox(
                  height: 30,
                ),
                const Information(text: "Confirm your own password"),
                const EmptySpace(multiple: 3.0),
                if (isValidate == false)
                  HeaderErrorMessage(confirmPassword: true),
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
                    labelText: "Re-enter your password",
                    labelStyle: theme.primaryTextTheme.subhead.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isValidate == false) FooterErrorMessage(),
        const EmptySpace(),
        CustomButton(
          text: "NEXT",
          onPressed: onPressed,
        ),
      ],
    );
  }

  void onPressed() {
    if (widget.password == passwordController.text) {
      Router.goToWidget(context: context, page: widget.page ?? MicroLoading());
      return;
    }
    isValidate = false;
    setState(() {});
  }
}

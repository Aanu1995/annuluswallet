import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_password.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:provider/provider.dart';

import 'components/footer_success_message.dart';
import 'components/header_error_message.dart';

class CreatePasswordPage extends StatelessWidget {
  final String text;
  final page;
  CreatePasswordPage({this.text, this.page});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: InfoDisplayProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: BackArrow(),
        ),
        body: _CreatePasswordPage(text: text, page: page),
      ),
    );
  }
}

class _CreatePasswordPage extends StatefulWidget {
  final String text;
  final page;
  _CreatePasswordPage({this.text, this.page});
  @override
  __CreatePasswordPageState createState() => __CreatePasswordPageState();
}

class __CreatePasswordPageState extends State<_CreatePasswordPage> {
  final passwordController = TextEditingController();

  bool isVisible = true; // password field visibility status
  bool isValidate; // password validator status

  final GlobalKey _infoPopupKey = GlobalKey();
  Offset _infoOffset = Offset(0.0, 0.0);

// this returns true if passwpord length is greater than 8
  bool passwordLengthStatus = false;
// this returns -1 if password is not correct
  int passwordState = -1;

  String _info =
      "Confirm your password by re-entering the password that you have just created in the last step. Yar, tell me about it!";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _infoPopupKey.currentContext.findRenderObject();
      _infoOffset = infoButton.localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var color = isValidate == true || isValidate == null
        ? theme.iconTheme.color
        : Colors.red;
    final infoProvider = Provider.of<InfoDisplayProvider>(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30.0),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.text ?? "Step 1 of 4",
                  style: theme.primaryTextTheme.title,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      EmptySpace(multiple: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Create your own password ",
                            style: theme.primaryTextTheme.title.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.info_outline,
                              key: _infoPopupKey,
                              size: 30.0,
                            ),
                            onTap: () => infoProvider.display(),
                          ),
                        ],
                      ),
                      EmptySpace(multiple: 3.0),
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
          ),
        ),
        infoProvider.isDisplayed
            ? ShowCase(
                offset: _infoOffset,
                info: _info,
              )
            : Offstage()
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

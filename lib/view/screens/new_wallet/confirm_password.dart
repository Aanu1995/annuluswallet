import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:flutter/material.dart';

import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:provider/provider.dart';

import 'create_password/components/header_error_message.dart';

class ConfirmPasswordPage extends StatelessWidget {
  final String text;
  final String password;
  final page;
  ConfirmPasswordPage({this.text, this.page, this.password});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: InfoDisplayProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: BackArrow(),
        ),
        body: _ConfirmPasswordPage(
          text: text,
          page: page,
          password: password,
        ),
      ),
    );
  }
}

class _ConfirmPasswordPage extends StatefulWidget {
  final String text;
  final String password;
  final page;
  _ConfirmPasswordPage({this.text, this.page, this.password});
  @override
  __ConfirmPasswordPageState createState() => __ConfirmPasswordPageState();
}

class __ConfirmPasswordPageState extends State<_ConfirmPasswordPage> {
  final passwordController = TextEditingController();

  bool isVisible = true; // password field visibility status
  bool isValidate; // password validator status

  final GlobalKey _infoPopupKey = GlobalKey();
  Offset _infoOffset = Offset(0.0, 0.0);

// this returns true if passwpord length is greater than 8
  bool passwordLengthStatus = false;
// this returns -1 if password is not correct

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
                  widget.text ?? "Step 2 of 4",
                  style: theme.primaryTextTheme.title,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Confirm your own password ",
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
              EmptySpace(),
              CustomButton(
                text: "NEXT",
                onPressed: onPressed,
              ),
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
    if (widget.password == passwordController.text) {
      Router.goToWidget(context: context, page: widget.page ?? MicroLoading());
      return;
    }
    isValidate = false;
    setState(() {});
  }
}

import 'package:flutter/material.dart';

import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/screens/new_wallet/create_password/components/header_error_message.dart';

class LoginScreen extends StatelessWidget {
  final page;
  const LoginScreen({this.page});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: FingerprintPopupProvider(),
      child: _LoginScreen(page: page),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  final page;
  _LoginScreen({this.page});
  @override
  __LoginScreenState createState() => __LoginScreenState();
}

class __LoginScreenState extends State<_LoginScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final passwordController = TextEditingController();

  bool isVisible = true;
  bool isValidate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    var color = isValidate == true || isValidate == null
        ? theme.iconTheme.color
        : Colors.red;
    final fingerProvider = Provider.of<FingerprintPopupProvider>(context);
    return Scaffold(
      key: _globalKey,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 80),
        child: AppBarDrawerLogo(globalKey: _globalKey),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const EmptySpace(multiple: 4.0),
                  Text(
                    "Welcome back",
                    style: theme.textTheme.title.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.3,
                    ),
                  ),
                  const EmptySpace(multiple: 6.0),
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
                  ),
                  if (isValidate == false) EmptyFieldMessage(),
                  const EmptySpace(multiple: 10.0),
                  CustomButton(text: "LOGIN", onPressed: onPressed),
                  const EmptySpace(),
                  Align(
                    alignment: Alignment.topRight,
                    child: FlatButton(
                      child: Text(
                        "FORGOT PASSWORD",
                        style: theme.textTheme.subtitle.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const EmptySpace(multiple: 5.0),
                  InkWell(
                    child: Image.asset(
                      touchId,
                      height: 60.0,
                      width: 60.0,
                    ),
                    onTap: () => fingerProvider.display(),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
            if (fingerProvider.isDisplayed) FingerprintPopup()
          ],
        ),
      ),
      drawer: UnAuthenticatedDrawer(),
      floatingActionButton: VersionTypeText(),
    );
  }

  void onPressed() {
    if (passwordController.text.isNotEmpty) {
      Router.goToWidget(context: context, page: widget.page ?? DashBoardPage());
      return;
    }
    isValidate = false;
    setState(() {});
  }
}

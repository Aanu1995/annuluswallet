import 'package:annuluswallet/view/components/export_components.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/model/colors.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';

class LoginScreen extends StatefulWidget {
  final page;
  LoginScreen({this.page});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();

  bool isVisible = true;
  bool isClicked = false;
  bool isValidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: drawerOnly(context: context, globalKey: _globalKey),
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(logo, height: 42, width: 124),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 24.0,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: isValidate == true || isValidate == null
                            ? Theme.of(context).iconTheme.color
                            : Color(0xFFf55d7f),
                      ),
                    ),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: isValidate == true || isValidate == null
                            ? Theme.of(context).iconTheme.color
                            : Color(0xFFf55d7f),
                      ),
                      child: TextField(
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        obscureText: isVisible,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Container(
                              padding: EdgeInsets.only(right: 10.0),
                              child: GestureDetector(
                                child: Image.asset(isVisible ? show : showOff),
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                              )),
                          focusColor: Theme.of(context).iconTheme.color,
                          hintText: "Enter your password to continue",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isValidate = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                widget.page ?? DashBoardPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 30.0, bottom: 10.0, left: 16.0, right: 16.0),
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).iconTheme.color,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "FORGOT PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      letterSpacing: 0.7,
                      color: infoColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      touchId,
                      height: 80.0,
                      width: 80.0,
                    )),
                SizedBox(height: 30.0),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: isClicked
                ? Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Authenticate",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0,
                              letterSpacing: 1.5,
                              color: Theme.of(context).appBarTheme.color,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  touch,
                                  height: 80.0,
                                  width: 80.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Touch the fingerprint sensor",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0,
                                    letterSpacing: 0.7,
                                    color: Theme.of(context).appBarTheme.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                isClicked = !isClicked;
                              });
                            },
                            child: Text(
                              "CANCEL",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.7,
                                color: Color(0xFF008877),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
      drawer: UnAuthenticatedDrawer(),
      floatingActionButton: VersionTypeText(),
    );
  }
}

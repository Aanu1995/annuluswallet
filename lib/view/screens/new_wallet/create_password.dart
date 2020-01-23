import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:annuluswallet/model/data.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/confirm_password.dart';
import 'package:annuluswallet/view/screens/showcase/showcase.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/routes.dart';

class CreatePasswordPage extends StatefulWidget {
  final String text;
  final page;
  CreatePasswordPage({this.text, this.page});
  @override
  _CreatePasswordPageState createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  bool isDialog = false; // This is used to display the information container
  bool isValidate;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final GlobalKey _two = GlobalKey();
  Offset infoContainer = Offset(0.0, 0.0);
  final String match = "Invalid Password please try again";
  final String description =
      "Create a password that contains:\nCapital letters, Special characters and Numbers, and must be more than 8 characters.\nExample:\nRapiD\$WALlet3001!LeT\$DoThi\$!";

  bool isPasswordLength;
  int isPasswordCorrect = -1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _two.currentContext.findRenderObject();
      infoContainer = infoButton.localToGlobal(Offset.zero);
      print(infoContainer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          key: _globalKey,
          appBar: newWalletAppBar2(context, height: 60.0),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      widget.text ?? "Step 1 of 4",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Create your own password",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            key: _two,
                            icon: Icon(
                              Icons.info_outline,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isDialog = true;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      isValidate == null
                          ? Container()
                          : Column(
                              children: <Widget>[
                                Container(
                                  height: 40.0,
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color:
                                        isValidate == true || isValidate == null
                                            ? Colors.transparent
                                            : Color(0xFF141414),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child:
                                      isValidate == true || isValidate == null
                                          ? Container()
                                          : Text(
                                              match,
                                              style: TextStyle(
                                                  color: Color(0xFFf55d7f),
                                                  fontSize: 17.0),
                                            ),
                                ),
                                SizedBox(height: 16.0),
                              ],
                            ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color:
                                      isValidate == true || isValidate == null
                                          ? Theme.of(context).iconTheme.color
                                          : Color(0xFFf55d7f),
                                ),
                              ),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor:
                                      isValidate == true || isValidate == null
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
                                        child: Image.asset(
                                            isVisible ? show : showOff),
                                        onTap: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    focusColor:
                                        Theme.of(context).iconTheme.color,
                                    hintText: "Enter your password",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        letterSpacing: 1.0),
                                  ),
                                  onChanged: (value) {
                                    isValidate = null;
                                    validation(value);
                                  },
                                ),
                              ))),
                      SizedBox(
                        height: 20.0,
                      ),
                      isPasswordCorrect == -1 || isValidate == false
                          ? Container()
                          : RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Password Strength is ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  TextSpan(
                                    text: isPasswordCorrect == 1
                                        ? "whack"
                                        : isPasswordCorrect == 2
                                            ? "not cool"
                                            : isPasswordCorrect == 3
                                                ? "is just okay"
                                                : "is solid good",
                                    style: TextStyle(
                                      color: isPasswordCorrect == 1
                                          ? Color(0xFFf55d7f)
                                          : isPasswordCorrect == 2
                                              ? Colors.yellow
                                              : Colors.greenAccent,
                                      letterSpacing: 1.5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 12.0,
                      ),
                      isValidate == false
                          ? Container()
                          : isPasswordLength == false
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Password Length is ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "too short",
                                        style: TextStyle(
                                          color: Color(0xFFf55d7f),
                                          letterSpacing: 1.5,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(),
                      SizedBox(
                        height: 20.0,
                      ),
                      isValidate == true || isValidate == null
                          ? Container()
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      incrorrectPassword,
                                      style: TextStyle(
                                          color: Color(0xFFf55d7f),
                                          height: 1.5,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    child: Text(
                                      example,
                                      style: TextStyle(
                                          color: Color(0xFFf55d7f),
                                          height: 1.5,
                                          letterSpacing: 1.5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                )),
                isValidate == false || isPasswordCorrect != 4
                    ? Container()
                    : Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Remember to write down this password, encrypt it and store it securely!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  letterSpacing: 1.5),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                ButtonFilled(
                  text: "NEXT",
                  margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  height: 60.0,
                  onTap: () {
                    SystemChannels.textInput
                        .invokeMethod('TextInput.hide')
                        .whenComplete(() {
                      if (isPasswordCorrect == 4) {
                        push(
                          context: context,
                          page: widget.page ??
                              ConfirmPasswordPage(
                                password: passwordController.text,
                              ),
                        );
                      } else {
                        setState(() {
                          isValidate = false;
                        });
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        if (isDialog)
          ShowCase(
            description: description,
            infoContainer: infoContainer,
            onTap: () {
              setState(() {
                isDialog = false;
              });
            },
          )
      ],
    );
  }

  validation(String password) {
    RegExp isUpperCase = RegExp(r'[A-Z]+');
    RegExp isNumber = RegExp(r'[0-9]+');
    RegExp isSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]+');
    bool upper = false;
    bool symbol = false;
    bool number = false;
    if (password.length > 8) {
      isPasswordLength = true;
    } else {
      isPasswordLength = false;
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
      isPasswordCorrect = 1;
    }
    if (upper || symbol || number && isPasswordLength) {
      isPasswordCorrect = 2;
    }
    if ((upper && symbol) ||
        (upper & number) ||
        (symbol && number) && isPasswordLength) {
      isPasswordCorrect = 3;
    }
    if (upper && symbol && number && isPasswordLength) {
      isPasswordCorrect = 4;
    }

    setState(() {});
  }
}

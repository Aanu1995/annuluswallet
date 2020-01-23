import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/view/screens/new_wallet/micro_loading.dart';
import 'package:annuluswallet/view/screens/showcase/showcase.dart';
import 'package:annuluswallet/view/widget/app_bar.dart';
import 'package:annuluswallet/view/widget/common.dart';
import 'package:annuluswallet/view/widget/routes.dart';

class ConfirmPasswordPage extends StatefulWidget {
  final String text;
  final String password;
  final page;
  ConfirmPasswordPage({this.text, this.page, this.password});
  @override
  _ConfirmPasswordPageState createState() => _ConfirmPasswordPageState();
}

class _ConfirmPasswordPageState extends State<ConfirmPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  final GlobalKey _two = GlobalKey();
  bool isDialog = false;
  Offset infoContainer = Offset(0.0, 0.0);
  bool isValidate;
  String description =
      "Confirm your password by re-entering the password that you have just created on the last step. Yar, tell me about it!";
  final String error =
      "Please ensure that the password is an exact match and that you saved it! \nHint: Select \'SHOW\' to view your password before  submitting or select back and start over, oh boy!";

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
          resizeToAvoidBottomPadding: true,
          appBar: newWalletAppBar2(context, height: 60.0),
          body: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    widget.text ?? "Step 2 of 4",
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Confirm your password",
                            style: TextStyle(
                              fontSize: 20.0,
                              letterSpacing: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
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
                        height: 20.0,
                      ),
                      Container(
                        height: 40.0,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: isValidate == true || isValidate == null
                              ? Colors.transparent
                              : Color(0xFF141414),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: isValidate == true || isValidate == null
                            ? Container()
                            : Text(
                                "Password doesn't match please try again",
                                style: TextStyle(
                                    color: Color(0xFFf55d7f), fontSize: 17.0),
                              ),
                      ),
                      SizedBox(
                        height: 16.0,
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
                                        )),
                                    focusColor:
                                        Theme.of(context).iconTheme.color,
                                    hintText: "Re-enter your password",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        letterSpacing: 1.0),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isValidate = null;
                                    });
                                  },
                                ),
                              ))),
                      SizedBox(
                        height: 50.0,
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
                                      error,
                                      style: TextStyle(
                                        color: Color(0xFFf55d7f),
                                        height: 1.5,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ),
              ButtonFilled(
                text: "NEXT",
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                height: 60.0,
                onTap: () {
                  SystemChannels.textInput
                      .invokeMethod('TextInput.hide')
                      .whenComplete(() {
                    if (widget.password == passwordController.text) {
                      pushAndRemoveUntil(
                          context: context,
                          page: widget.page ?? MicroLoading());
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
}

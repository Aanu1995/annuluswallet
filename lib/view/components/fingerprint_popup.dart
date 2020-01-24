import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FingerprintPopup extends StatefulWidget {
  @override
  _FingerprintPopupState createState() => _FingerprintPopupState();
}

class _FingerprintPopupState extends State<FingerprintPopup>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final fingerProvider =
        Provider.of<FingerprintPopupProvider>(context, listen: false);
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform:
                Matrix4.translationValues(width * _animation.value, 0.0, 0.0),
            child: Container(
              height: 275,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Authenticate",
                      style: theme.primaryTextTheme.title.copyWith(
                        color: theme.appBarTheme.color,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    EmptySpace(multiple: 5.0),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            touch,
                            height: 60.0,
                            width: 60.0,
                          ),
                          EmptySpace(multiple: 1.2),
                          Text(
                            "Touch the fingerprint sensor",
                            style: theme.primaryTextTheme.subtitle.copyWith(
                              color: theme.appBarTheme.color,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    EmptySpace(multiple: 4),
                    FlatButton(
                      child: Text(
                        "CANCEL",
                        style: theme.primaryTextTheme.subhead.copyWith(
                          color: theme.appBarTheme.color,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () async {
                        await _controller.reverse();
                        fingerProvider.display();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

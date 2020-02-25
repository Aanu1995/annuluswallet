import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CopyDialog extends StatefulWidget {
  final EdgeInsets margin;
  final String title;
  CopyDialog({this.margin, this.title});

  @override
  _CopyDialogState createState() => _CopyDialogState();
}

class _CopyDialogState extends State<CopyDialog>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
    delay();
  }

  delay() async {
    _controller.addStatusListener((status) async {
      final clipboard = Provider.of<ClipBoardProvider>(context, listen: false);
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: 2));
        await _controller.reverse();
        clipboard.setClipboardStatus("", false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ScaleTransition(
          scale: _animation,
          child: Container(
            height: 60,
            width: 300.0,
            decoration: BoxDecoration(
              color: Color(0xFF316368),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    copy,
                    height: 60.0,
                    width: 60.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    widget.title ?? "Copied to clipboard",
                    style: Theme.of(context).primaryTextTheme.subhead.copyWith(
                          color: Theme.of(context).iconTheme.color,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

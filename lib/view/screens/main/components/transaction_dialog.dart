import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';

class TransactionDialog {
  static void transactionDialog({BuildContext context}) {
    final textTheme = Theme.of(context).textTheme;
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  height: 185.0,
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pay to",
                        style: textTheme.subhead.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      EmptySpace(multiple: 2.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: _Card(
                              title: "Transfer",
                              subtitle: "Within our own Address",
                              logo: transfer,
                              color: Color(0xFF74c5b0),
                              onTap: () {
                                Navigator.pop(context);
                                Router.goToScreen(
                                    context: context,
                                    page: Routes.TRANSFERPAGE);
                              },
                            ),
                          ),
                          EmptySpace(),
                          Expanded(
                            child: _Card(
                              title: "Send",
                              subtitle: "To External Address",
                              logo: sent,
                              color: Color(0XFFf6a3ac),
                              onTap: () {
                                Navigator.pop(context);
                                Router.goToScreen(
                                    context: context, page: Routes.SENDPAGE);
                              },
                            ),
                          ),
                          EmptySpace(),
                          Expanded(
                            child: _Card(
                              title: "Receive",
                              subtitle: "To own address",
                              logo: receive,
                              color: Color(0xFF74c5b0),
                              onTap: () {
                                Navigator.pop(context);
                                Router.goToScreen(
                                    context: context, page: Routes.RECEIVEPAGE);
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: FloatingActionButton(
                  child: Image.asset(
                    close,
                    height: 35.0,
                    width: 35.0,
                  ),
                  onPressed: () => Router.goBack(context: context),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, animate, secondaryAnimate, child) {
        final anime = Tween<Offset>(begin: Offset(0.0, 0.5), end: Offset.zero)
            .animate(animate);
        return SlideTransition(
          position: anime,
          child: child,
        );
      },
      transitionDuration: Duration(seconds: 1),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String logo;
  final void Function() onTap;
  const _Card(
      {Key key, this.title, this.subtitle, this.color, this.logo, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xFFbababa),
          ),
        ),
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              logo,
              height: 40.0,
              width: 40.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.subhead,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: textTheme.caption.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

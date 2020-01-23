import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

class UnAuthenticatedDrawer extends StatelessWidget {
  final String item1 = "Help";
  final String item2 = "Recover passphase";
  final String item3 = "Annulus Network Website";
  final String item4 = "Twitter";
  final String item5 = "Telegram";
  final String item6 = "Discord";
  final String item7 = "Medium";
  final String item8 = "Facebook Ambassadors";
  final String item9 = "Reddit";
  final String item10 = "Get Annulus(\$RPD)";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: OutlineButton(
                  borderSide: BorderSide(color: theme.iconTheme.color),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "CLOSE",
                    style: Theme.of(context).primaryTextTheme.subtitle,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 16.0),
                  children: <Widget>[
                    _DrawerItems(title: item1, icon: help),
                    _DrawerItems(title: item2, icon: recover),
                    ListTile(
                      leading: Text(
                        "Join our community",
                        style: theme.primaryTextTheme.subhead.copyWith(
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ),
                    _DrawerItems(title: item3, icon: community),
                    _DrawerItems(title: item4, icon: twitter),
                    _DrawerItems(title: item5, icon: telegram),
                    _DrawerItems(title: item6, icon: discord),
                    _DrawerItems(title: item7, icon: medium),
                    _DrawerItems(title: item8, icon: facebook),
                    _DrawerItems(title: item9, icon: reddit),
                    ListTile(
                      leading: Text(
                        "Where to buy Annulus wallet",
                        style: theme.primaryTextTheme.subhead.copyWith(
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ),
                    _DrawerItems(title: item10, icon: community),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Text(
                  "Annulus Android Wallet version 1.0.1",
                  style: theme.primaryTextTheme.caption,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItems extends StatelessWidget {
  final String title;
  final String icon;
  final page;
  final iconColor;
  _DrawerItems({this.title, this.icon, this.page, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        icon,
        height: 26.0,
        width: 26.0,
        color: iconColor ?? Colors.white,
      ),
      title: Text(
        title,
        style: Theme.of(context).primaryTextTheme.subtitle,
      ),
    );
  }
}

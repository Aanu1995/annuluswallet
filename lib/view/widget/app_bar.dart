import 'package:flutter/material.dart';
import 'package:annuluswallet/model/images.dart';

// This AppBar has a leading back button, a trailing title and logo
class RapidAppBarBackButton extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext preContext;
  final String appTitle;
  RapidAppBarBackButton({this.preContext, this.appTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0),
      color: Theme.of(context).appBarTheme.color,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Image.asset(
                leftArrow,
                height: 25.0,
                color: Theme.of(context).iconTheme.color,
                width: 25.0,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      appTitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(logo2),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(preContext).size.width, 60);
}

//This appBar only has backbutton and the appLogo at the right side of the appBar
PreferredSize rapidPageAppBar2(
    {double size,
    String image,
    Function onTap,
    BuildContext context,
    double height,
    String appTitle}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height ?? 60),
    child: Container(
      color: Theme.of(context).appBarTheme.color,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 16.0, left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Image.asset(
                  image,
                  color: Theme.of(context).iconTheme.color,
                  height: size ?? 30.0,
                  width: size ?? 30.0,
                ),
                onTap: onTap,
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    appTitle,
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(logo2),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

//This appBar displays only the drawer button
PreferredSize drawerOnly(
    {BuildContext context, GlobalKey<ScaffoldState> globalKey}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 60),
    child: Center(
      child: Container(
        color: Theme.of(context).appBarTheme.color,
        padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 12.0),
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            globalKey.currentState.openDrawer();
          },
          child: Image.asset(
            drawer,
            height: 30.0,
            width: 30.0,
          ),
        ),
      ),
    ),
  );
}

//This appBar has only leading icon to direct the user back
PreferredSize newWalletAppBar1(BuildContext context,
    {double height, Color color}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height ?? 80),
    child: Container(
      color: color ?? Theme.of(context).appBarTheme.color,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: InkWell(
            child: Image.asset(
              leftArrow,
              height: 30.0,
              color: Theme.of(context).iconTheme.color,
              width: 30.0,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    ),
  );
}

// This appBar has both leading and trailing icons
PreferredSize newWalletAppBar2(
  BuildContext context, {
  double height,
  Function onTap,
}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, height ?? 80),
    child: Container(
      color: Theme.of(context).appBarTheme.color,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: <Widget>[
              InkWell(
                child: Image.asset(
                  leftArrow,
                  height: 30.0,
                  color: Theme.of(context).iconTheme.color,
                  width: 30.0,
                ),
                onTap: onTap ??
                    () {
                      Navigator.pop(context);
                    },
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 30.0,
                  color: Colors.white,
                  icon: Icon(Icons.close))
            ],
          ),
        ),
      ),
    ),
  );
}

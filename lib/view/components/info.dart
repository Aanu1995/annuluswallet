import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatefulWidget {
  final String text;
  const Information({Key key, this.text}) : super(key: key);

  @override
  __InformationState createState() => __InformationState();
}

class __InformationState extends State<Information> {
  final GlobalKey _infoPopupKey = GlobalKey();
  InfoDisplayProvider infoProvider;

  @override
  void initState() {
    super.initState();
    infoProvider = Provider.of<InfoDisplayProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      RenderBox infoButton = _infoPopupKey.currentContext.findRenderObject();
      infoProvider.setOffset = infoButton.localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "${widget.text} ",
          style: primaryTextTheme.title.copyWith(
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
    );
  }
}

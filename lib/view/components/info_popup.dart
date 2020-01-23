import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/view/components/empty_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPopup extends StatelessWidget {
  final offset;
  const InfoPopup({this.offset});
  final containerHeight = 150.0;
  final String _description =
      "You may recover a wallet by selecting 'RESTORE A WALLET' using your 24 mnemonic phrase words.";

  @override
  Widget build(BuildContext context) {
    final verticalOffset = offset.dy - AppBar().preferredSize.height - 225;
    final theme = Theme.of(context);
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: verticalOffset + (containerHeight - 30),
            left: offset.dx + 57,
            child: Icon(
              Icons.arrow_drop_down,
              size: 70.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: verticalOffset,
            child: Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              width: 300,
              height: containerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _description,
                    textAlign: TextAlign.justify,
                    style: theme.primaryTextTheme.subtitle
                        .copyWith(color: Colors.black, height: 1.4),
                  ),
                  EmptySpace(multiple: 3.0),
                  Consumer<InfoDisplayProvider>(
                    builder: (context, infoProvider, _) {
                      return InkWell(
                        child: Text(
                          "CLOSE",
                          style: theme.primaryTextTheme.subhead.copyWith(
                            color: theme.iconTheme.color,
                          ),
                        ),
                        onTap: () => infoProvider.display(),
                      );
                    },
                  ),
                  EmptySpace(multiple: 0.5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

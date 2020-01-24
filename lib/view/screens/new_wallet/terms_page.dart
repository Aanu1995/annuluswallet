import 'package:flutter/material.dart';

import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/router/router.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(elevation: 0.0, leading: BackArrow()),
      body: Column(
        children: <Widget>[
          Text(
            "Annulus Network Terms of Use",
            style: theme.primaryTextTheme.title,
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  TERMSANDCONDITIONS,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).primaryTextTheme.caption.copyWith(
                        height: 1.5,
                      ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: CustomButton(
              text: "I ACCEPT AND LET'S GO",
              onPressed: () => Router.goToScreen(
                context: context,
                page: Routes.IMPORTPAGE,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String TERMSANDCONDITIONS =
    'PLEASE READ THIS AGREEMENT (AS DEFINED BELOW) CAREFULLY BEFORE USING THE AnnulusWallet SERVICE (AS DEFINED BELOW). BY ACCESSING OR USING THE AnnulusWallet SERVICE, YOU SIGNIFY YOUR CONSENT TO THIS AGREEMENT. IF YOU DO NOT AGREE WITH ANY OF THE TERMS AND CONDITIONS OF THIS AGREEMENT, DO NOT USE THE AnnulusWallet SERVICE. DFS (AS DEFINED BELOW) RESERVES THE RIGHT, TO MODIFY OR UPDATE THIS AGREEMENT FROM TIME TO TIME AS IT DEEMS FIT WHICH MODIFICATIONS OR UPDATES SHALL AUTOMATICALLY BE BINDING ON YOU UPON PUBLICATION.  YOU ACKNOWLEDGE THAT IT IS YOUR RESPONSIBILITY TO CHECK REGULARLY FOR UPDATES TO THE TERMS AND CONDITIONS OF THIS AGREEMENT AT THE ABOVE SITE, AND TO IMMEDIATELY DISCONTINUE USE OF THE AnnulusWallet SERVICE, IF YOU DO NOT AGREE TO ANY UPDATE OR MODIFICATION TO THIS AGREEMENT. YOUR CONTINUED USE OF THE AnnulusWallet SERVICE FOLLOWING THE PUBLICATION OF A MODIFIED OR UPDATED AGREEMENT AS DESCRIBED ABOVE SHALL SIGNIFY YOUR CONSENT AND AGREEMENT TO THE MODIFIED OR UPDATED AGREEMENT, EFFECTIVE AT THE DATE OF PUBLICATION.  IF YOU ARE ACCESSING OR USING THE AnnulusWallet SERVICE ON BEHALF OF A CORPORATE ENTITY, YOU HEREBY REPRESENT AND WARRANT TO DFS THAT YOU HAVE THE AUTHORITY TO BIND THAT CORPORATE ENTITY, AND THAT YOU AGREE TO THE TERMS AND CONDITIONS OF THIS AGREEMENT ON BEHALF OF THAT CORPORATE ENTITY.';

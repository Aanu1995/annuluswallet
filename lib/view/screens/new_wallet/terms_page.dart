import 'package:flutter/material.dart';

import 'package:annuluswallet/model/images.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/custom_buttons.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: InkWell(
          child: Image.asset(
            leftArrow,
            height: 28.0,
            color: theme.iconTheme.color,
            width: 28.0,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "Annulus Network Terms of Use",
              style: theme.primaryTextTheme.title,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Html(
                  data: html,
                  defaultTextStyle: theme.primaryTextTheme.body1.copyWith(
                    letterSpacing: 1.4,
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

String html = """
<p>
Laoreet lectus nascetur odio nunc felis placerat euismod integer fusce justo ultrices ligula facilisis consequat cubilia interdum eros eu diam.
</p>
<p>
Placerat odio fusce euismod pulvinar facilisis consequat felis neque a primis at nam aliquam felis aenean turpis; eu nisi nec.
</p>
<p>
Orci facilisis senectus ornare maecenas aptent aptent dis condimentum senectus nisl lorem libero nisi aliquam malesuada congue, proin commodo feugiat.
</p>
<p>
Pulvinar vitae neque viverra dapibus varius torquent conubia, molestie facilisis maecenas vitae rhoncus quis class libero curae; per tortor cursus.
</p>
<p>
Vel sagittis metus neque sed dictumst tristique malesuada porta massa gravida natoque iaculis duis odio placerat vestibulum eu ullamcorper fusce.
</p>
<p>
Convallis rhoncus curabitur orci eu lobortis facilisi maecenas non accumsan consectetur pharetra justo pellentesque curae; magnis etiam gravida lorem conubia?
</p>
<p>
""";

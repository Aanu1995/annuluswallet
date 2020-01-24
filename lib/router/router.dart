import 'package:annuluswallet/view/components/customRoute.dart';
import 'package:flutter/material.dart';
export 'routes.dart';

class Router {
  static goToScreen({BuildContext context, String page}) {
    Navigator.pushNamed(context, page);
  }

  static goToReplaceScreen({BuildContext context, String page}) {
    Navigator.pushReplacementNamed(context, page);
  }

  static goToWidget({BuildContext context, Widget page}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static goToReplacementWidget({BuildContext context, Widget page}) {
    Navigator.pushReplacement(
        context, CustomPageRoute(builder: (context) => page));
  }

  static removeWidget({BuildContext context, Widget page}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}

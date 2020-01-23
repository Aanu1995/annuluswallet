import 'package:flutter/material.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/main/dashboard.dart';

void gotoDashBoard({BuildContext context, DashboardProvider provider}) {
  provider.setIndex = 1;
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => DashBoardPage()),
      (Route<dynamic> route) => false);
}

void push({BuildContext context, Widget page}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void pushAndRemoveUntil({BuildContext context, Widget page}) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}

void pushReplacement({BuildContext context, Widget page}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

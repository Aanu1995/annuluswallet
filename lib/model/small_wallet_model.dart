import 'package:flutter/material.dart';

class SmallWalletCardModel {
  final String walletType;
  final String currentValue;
  final String balance;
  final Color color;

  SmallWalletCardModel(
      {this.walletType, this.currentValue, this.balance, this.color});
}

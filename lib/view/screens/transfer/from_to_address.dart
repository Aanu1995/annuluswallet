import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/custom_buttons.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/selected_wallet.dart';
import 'package:flutter/material.dart';
import 'package:annuluswallet/provider/walletProvider.dart';
import 'package:annuluswallet/view/screens/transfer/function_widget.dart';
import 'package:annuluswallet/view/screens/transfer/transfer_confirm_payment.dart';
import 'package:provider/provider.dart';

class FromWalletToSendWallet extends StatefulWidget {
  final Wallet fromWallet;
  final Wallet toWallet;
  FromWalletToSendWallet({this.fromWallet, this.toWallet});

  @override
  _FromWalletToSendWalletState createState() => _FromWalletToSendWalletState();
}

class _FromWalletToSendWalletState extends State<FromWalletToSendWallet> {
  final Color color = Colors.black;
  TextEditingController labelController;
  TextEditingController amountController;
  FocusNode labelFocus;
  FocusNode amountFocus;

  @override
  void initState() {
    super.initState();
    labelController = TextEditingController();
    amountController = TextEditingController();
    labelFocus = FocusNode();
    amountFocus = FocusNode();
  }

  @override
  void dispose() {
    labelController.dispose();
    amountController.dispose();
    labelFocus.dispose();
    amountFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider provider = Provider.of<DashboardProvider>(context);
    final borderColor = Theme.of(context).iconTheme.color;
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.5),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Transfer",
          subtitle: "To Own Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              HeadText(),
              SelectedWallet(
                wallet: widget.fromWallet,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              HeadText(text: "TO ADDRESS"),
              SelectedWallet(
                wallet: widget.toWallet,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              EmptySpace(multiple: 4.0),
              TextField(
                controller: labelController,
                focusNode: labelFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  labelText: "Label",
                ),
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(amountFocus);
                },
              ),
              const EmptySpace(multiple: 3.0),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                focusNode: amountFocus,
                decoration: InputDecoration(
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  labelText: "Amount (RPD)",
                ),
              ),
              const EmptySpace(multiple: 4.0),
              CustomButton(
                text: "REQUEST PAYMENT",
                onPressed: () => Router.goToWidget(
                  context: context,
                  page: TransferConfirmPayment(
                    fromWallet: widget.fromWallet,
                    toWallet: widget.toWallet,
                    amount: amountController.text,
                  ),
                ),
              ),
              const EmptySpace(multiple: 2.0),
              CustomOutlineButton(
                text: "CANCEL",
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  TransferWidgetFunction()
                      .cancelPayment(context: context, provider: provider);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

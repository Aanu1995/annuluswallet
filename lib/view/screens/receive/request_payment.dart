import 'package:annuluswallet/model/wallet.dart';
import 'package:annuluswallet/provider/info_display_provider.dart';
import 'package:annuluswallet/router/router.dart';
import 'package:annuluswallet/view/components/export_components.dart';
import 'package:annuluswallet/view/components/scan.dart';
import 'package:annuluswallet/view/components/selected_wallet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:annuluswallet/view/screens/receive/payment.dart';

class RequestPaymentPage extends StatefulWidget {
  final Wallet wallet;
  RequestPaymentPage({this.wallet});

  @override
  _RequestPaymentPageState createState() => _RequestPaymentPageState();
}

class _RequestPaymentPageState extends State<RequestPaymentPage> {
  TextEditingController labelController;
  TextEditingController amountController;
  FocusNode labelFocus;
  FocusNode amountFocus;
  bool status = false;

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
    labelFocus.dispose();
    amountFocus.dispose();
    labelFocus.dispose();
    amountFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clipboard = Provider.of<ClipBoardProvider>(context);
    final borderColor = Theme.of(context).iconTheme.color;
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.5),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 70),
        child: TransactionAppBar(
          title: "Receive",
          subtitle: "To Own Address",
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  HeadText(text: "TO ADDRESS"),
                  SelectedWallet(
                    wallet: widget.wallet,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const EmptySpace(multiple: 2.0),
                  Align(
                    alignment: Alignment.topRight,
                    child: Scan(
                      title: "COPY ADDRESS",
                      onTap: () =>
                          clipboard.setClipboardStatus(widget.wallet.id, true),
                    ),
                  ),
                  const EmptySpace(multiple: 4.0),
                  TextField(
                    focusNode: labelFocus,
                    controller: labelController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: "Label",
                    ),
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(amountFocus);
                    },
                  ),
                  const EmptySpace(multiple: 3.0),
                  TextField(
                    focusNode: amountFocus,
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      enabledBorder: border,
                      focusedBorder: border,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: "Receiving Amount (RPD)",
                    ),
                  ),
                  const EmptySpace(multiple: 4.0),
                  CustomButton(
                    text: "REQUEST PAYMENT",
                    onPressed: () {
                      Router.removeWidget(
                        context: context,
                        page: PaymentPage(
                          label: labelController.text,
                          amount: amountController.text,
                          wallet: widget.wallet,
                        ),
                      );
                    },
                  ),
                  const EmptySpace(multiple: 2.0),
                  CustomOutlineButton(
                    text: "CANCEL",
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          if (clipboard.getClipboardStatus)
            Center(
              child: CopyDialog(),
            )
        ],
      ),
    );
  }

  bool check(String label, String amount) {
    if (amount.isNotEmpty && label.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

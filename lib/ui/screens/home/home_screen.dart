import 'package:flutter/material.dart';
import 'package:uzpay/enums.dart';
import 'package:uzpay/objects.dart';
import 'package:uzpay/uzpay.dart';

import '../../widgets/global_button_widget.dart';
class PayMe extends StatefulWidget {
  const PayMe({super.key});
  @override
  State<PayMe> createState() => _PayMeState();
}
class _PayMeState extends State<PayMe> {
  void doPay() async {
    UzPay.doPayment(
      context,
      amount: 1,
      paymentSystem: PaymentSystem.Payme,
      paymentParams: Params(
        paymeParams: PaymeParams(
          transactionParam: '10',
          merchantId: '6443d473096a61fb42c216af',
          accountObject: 'key',
        ),
      ),
      browserType: BrowserType.External,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uzbek Payment Systems 🇺🇿💳'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("To'lov tizimlari",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 20)),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            GlobalLoadingButton(
              title: 'Payme',
              onTap: doPay,
            ),
          ],
        ),
      ),
    );
  }
}

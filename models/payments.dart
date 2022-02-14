import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _PaymentState extends State<Payment> {
  final String txref = "My_unique_transaction_reference_123";
  final String amount = "500000";
  final String currency = FlutterwaveCurrency.UGX;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _makePayments(String phoneNumber, String amount) async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        encryptionKey: "1ae09d8e11e4aa2929e387c4",
        publicKey: "FLWPUBK-0a0489cd8a536f74e02fcd17558d84d3-X",
        currency: this.currency,
        amount: amount,
        email: "mataomuto@email.com",
        fullName: "KIZITO RICHARD",
        txRef: this.txref,
        isDebugMode: true,
        phoneNumber: phoneNumber,
        acceptCardPayment: true,
        acceptUSSDPayment: false,
        acceptAccountPayment: false,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: false,
        acceptMpesaPayment: false,
        acceptRwandaMoneyPayment: false,
        acceptUgandaPayment: true,
        acceptZambiaPayment: false);

    try {
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        print('TRANSACTION FAILED');
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response);
        if (isSuccessful) {
        } else {
          print(response.message);

          print(response.status);

          print(response.data?.processorResponse);
        }
      }
    } catch (error, stacktrace) {}
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data?.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data?.currency == this.currency &&
        response.data?.amount == this.amount &&
        response.data?.txRef == this.txref;
  }
}

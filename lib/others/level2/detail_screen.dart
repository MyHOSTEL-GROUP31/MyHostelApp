import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:myhostel/others/level3/hotel_info.dart';
import 'package:myhostel/others/level2/constants.dart';
import 'package:myhostel/others/level3/detail_extension.dart';
import 'package:myhostel/models/map.dart';
import 'package:myhostel/models/payments.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.hotel);
  final HotelInfo hotel;

  static const _LOADING_IMAGE = 'assets/images/load.gif';
  static const _BACKWARD_ICON = 'assets/images/load.gif';
  final String txref = "My_unique_transaction_reference_123";
  final String amount = "500000";
  final String currency = FlutterwaveCurrency.UGX;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    final String txref = "My_unique_transaction_reference_123";
    final String amount = "500000";
    final String currency = FlutterwaveCurrency.UGX;
    final _dtlPriceTextStyle = Theme.of(context)
        .textTheme
        .headline3
        ?.copyWith(color: kBackgroundLightColor, fontWeight: FontWeight.w500);
    final _dtlSubTextStyle = Theme.of(context)
        .textTheme
        .headline5
        ?.copyWith(color: kBackgroundLightColor, fontWeight: FontWeight.normal);
    final _dtlButtonTextStyle = Theme.of(context).textTheme.headline6?.copyWith(
        color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 14);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox.expand(
                child: FadeInImage(
                  image: ResizeImage(AssetImage(hotel.image),
                      width: _screenWidth.round(),
                      height: _screenHeight.round()),
                  placeholder: AssetImage(_LOADING_IMAGE),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 24,
                  width: 24,
                  child:
                      Image.asset(_BACKWARD_ICON, color: kBackgroundLightColor),
                ),
              ),
            ),

            // Draggable for extended the info
            DraggableScrollableSheet(
                initialChildSize: .2,
                maxChildSize: .5,
                minChildSize: .2,
                builder: (context, scrollController) => Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          height: _screenHeight * 0.45,
                          decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Stack(
                            children: [
                              DetailExtension(hotel),
                              Positioned(
                                top: 12,
                                left: _screenWidth / 2 - 12,
                                child: Container(
                                  width: 24,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: kSubTextColor.withOpacity(.3),
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ],
        ),
      ),

      // Bottom contain price and booking button
      bottomNavigationBar: SizedBox(
          height: 72,
          child: Container(
            padding: PAD_SYM_H20,
            color: kPrimaryColor,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('500000UGX/SEM', style: _dtlSubTextStyle),
                  Spacer(),
                  RawMaterialButton(
                      elevation: 0,
                      fillColor: kBackgroundLightColor,
                      constraints: BoxConstraints(minHeight: 42, minWidth: 100),
                      onPressed: () {
                        _makePayments(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(DTL_BOOKING_TEXT, style: _dtlButtonTextStyle))
                ],
              ),
            ),
          )),
    );
  }

  void _makePayments(BuildContext context) async {
    {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: context,
          encryptionKey: "Your_test_encryption_key_here",
          publicKey: "Your_test_public_key_here",
          currency: currency,
          amount: amount,
          email: "mataomuto@gmail.com",
          fullName: "KIZITO RICHARD",
          txRef: txref,
          isDebugMode: true,
          phoneNumber: "0756131020",
          acceptCardPayment: true,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: true,
          acceptZambiaPayment: false);

      //final ChargeResponse response = await flutterwave.initializeForUiPayments();
      try {
        final ChargeResponse response =
            await flutterwave.initializeForUiPayments();
        if (response == null) {
          // user didn't complete the transaction.
          print('TRANSACTION FAILED');
        } else {
          final isSuccessful = checkPaymentIsSuccessful(response);
          if (isSuccessful) {
            // provide value to customer
          } else {
            // check message
            print(response.message);

            // check status
            print(response.status);

            // check processor error
            print(response.data?.processorResponse);
          }
        }
      } catch (error, stacktrace) {
        // handleError(error);
      }
    }
  }

  bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data?.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data?.currency == currency &&
        response.data?.amount == amount &&
        response.data?.txRef == txref;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payme/core/utils/api_keys.dart';
import 'package:payme/features/checkout/view/my_cart_view.dart';
void main () {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const Payme());
}

class Payme extends StatelessWidget {
  const Payme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyCartView(),
    );
  }
}

// 1. [Payment Intent Model] create payment intent (amount + currency [required] + customer id [optional])
// 1.2. [KeySecret] create EphemeralKey(StripeVersion, customerId)
// 2. init payment sheet (merchantDisplayName, payment intent client secret, ephemeralKeySecret)
// 3. present payment sheet

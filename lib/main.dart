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

// 1. [payment intent object] create payment intent (amount + currency [required])
// 2. init payment sheet (payment intent client secret)
// 3. present payment sheet

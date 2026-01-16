import 'package:flutter/material.dart';
import 'package:payme/features/checkout/view/widgets/custom_text_price.dart';

class ThankYouOderInfoSection extends StatelessWidget {
  const ThankYouOderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextPrice(text: "Date", price: "15/01/2026"),
        SizedBox(height: 20),
        CustomTextPrice(text: "Time", price: "11:29 PM"),
        SizedBox(height: 20),
        CustomTextPrice(text: "To", price: "Osama Ahmed"),
        SizedBox(height: 30),
        Divider(thickness: 2,),
        SizedBox(height: 24),
        CustomTextPrice(text: "Total", price: r"$50.97", total: true),
      ],
    );
  }
}

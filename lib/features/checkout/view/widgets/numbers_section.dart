import 'package:flutter/material.dart';
import 'package:payme/features/checkout/view/widgets/custom_text_price.dart';

class NumbersSection extends StatelessWidget {
  const NumbersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextPrice(text: "Order Subtotal", price: r"$42.97"),
        CustomTextPrice(text: "Discount", price: r"$0"),
        CustomTextPrice(text: "Discount", price: r"$0"),
        CustomTextPrice(text: "Shipping", price: r"$8"),
        Divider(indent: 15, endIndent: 15),
        CustomTextPrice(text: "Total", price: r"$50.97", total: true),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payme/view/widgets/custom_text_calc.dart';

import 'custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 25,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 35), child: Image.asset("assets/images/cart_pic.png", height: 424, width: 277,)),
            const SizedBox(height: 25,),
            const Spacer(),
            const CustomTextPrice(text: "Order Subtotal", price: r"$42.97"),
            const CustomTextPrice(text: "Discount", price: r"$0"),
            const CustomTextPrice(text: "Shipping", price: r"$8"),
            const Divider(indent: 15, endIndent: 15,),
            const CustomTextPrice(text: "Total", price: r"$50.97", total: true,),
            const SizedBox(height: 16,),
            const CustomButton(text: "CustomButton`"),
            const SizedBox(height:35,),
          ],
        ),
      ),
    );
  }
}

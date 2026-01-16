import 'package:flutter/material.dart';
import 'package:payme/features/checkout/view/widgets/numbers_section.dart';
import 'package:payme/features/checkout/view/widgets/payment_methods_section.dart';
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Image.asset(
                  "assets/images/cart_pic.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const NumbersSection(),
            const SizedBox(height: 16),
            CustomButton(
              text: "Complete Payment",
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const PaymentOptionsBottomSheet(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionsBottomSheet extends StatelessWidget {
  const PaymentOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodsSection(),
          const SizedBox(height: 16,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: const CustomButton(text: "Continue"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payme/view/payment_details_view.dart';
import 'package:payme/view/widgets/numbers_section.dart';
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
            CustomButton(text: "Complete Payment", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentDetailsView()),
              );
            },),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}

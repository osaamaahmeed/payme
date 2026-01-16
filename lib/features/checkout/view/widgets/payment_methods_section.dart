import 'package:flutter/material.dart';
import 'package:payme/features/checkout/view/widgets/custom_payment_container.dart';

class PaymentMethodsSection extends StatefulWidget {
  const PaymentMethodsSection({super.key});

  @override
  State<PaymentMethodsSection> createState() => _PaymentMethodsSectionState();
}

class _PaymentMethodsSectionState extends State<PaymentMethodsSection> {
  static final List<String> paymentMethods = ["assets/images/creditcard.png", "assets/images/paypal.png", "assets/images/applepay.png"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(paymentMethods.length, (index){
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: CustomPaymentContainer(isSelected: selectedIndex == index, image: paymentMethods[index],),
          ),
        );
      } ),
    );
  }
}

// intersic height ?
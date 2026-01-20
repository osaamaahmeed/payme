import 'package:flutter/material.dart';
import 'package:payme/features/checkout/view/widgets/payment_methods_section.dart';
import 'custom_button_bloc_consumer_section.dart';

class PaymentOptionsBottomSheet extends StatefulWidget {
  const PaymentOptionsBottomSheet({super.key});

  @override
  State<PaymentOptionsBottomSheet> createState() => _PaymentOptionsBottomSheetState();
}

class _PaymentOptionsBottomSheetState extends State<PaymentOptionsBottomSheet> {
  int index = 0;
  void updatePaymentOption ({required int index}) {
    setState(() {
      this.index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsSection(updatePaymentOption: updatePaymentOption,),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomButtonBlocConsumerSection(index: index,),
          ),
        ],
      ),
    );
  }
}

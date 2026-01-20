import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payme/features/checkout/view/thank_you_view.dart';
import 'package:payme/features/checkout/view/widgets/payment_methods_section.dart';
import 'package:payme/features/checkout/viewmodels/cubits/payment_cubit/payment_cubit.dart';

import 'custom_button.dart';
import 'custom_button_bloc_consumer_section.dart';

class PaymentOptionsBottomSheet extends StatelessWidget {
  const PaymentOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodsSection(),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomButtonBlocConsumerSection(),
          ),
        ],
      ),
    );
  }
}

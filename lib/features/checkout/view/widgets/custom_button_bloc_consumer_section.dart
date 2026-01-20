import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payme/features/checkout/models/payment_intent_input_model.dart';

import '../../viewmodels/cubits/payment_cubit/payment_cubit.dart';
import '../thank_you_view.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumerSection extends StatelessWidget {
  const CustomButtonBlocConsumerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      builder: (BuildContext context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: '100',
                  currency: 'USD',
                  customerId: 'cus_Tp70Tk3gbZhWiq',
                );
            BlocProvider.of<PaymentCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          text: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
      listener: (BuildContext context, state) {
        if (state is PaymentSuccess) {
          print('should push!');
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
          print('pushed?');
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}

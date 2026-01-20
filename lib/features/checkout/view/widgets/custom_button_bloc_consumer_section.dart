import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/get_transactions.dart';
import '../../../../core/functions/paypal_payment_functions.dart';
import '../../../../core/functions/stripe_payment_functions.dart';
import '../../viewmodels/cubits/payment_cubit/payment_cubit.dart';
import '../thank_you_view.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumerSection extends StatelessWidget {
  const CustomButtonBlocConsumerSection({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      builder: (BuildContext context, state) {
        return CustomButton(
          onTap: () {
            if (index == 0) {
              executeStripePayment(context);
            } else if (index == 1) {
              var transactionsData = getTransactionsData();
              executePaypalPayment(context, transactionsData);
            } else {
              SnackBar snackBar = SnackBar(content: Text("Coming Soon !"));
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          text: "Continue",
          isLoading: state is PaymentLoading ? true : false,
        );
      },
      listener: (BuildContext context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
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

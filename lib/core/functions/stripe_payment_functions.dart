import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/checkout/models/payment_intent_input_model.dart';
import '../../features/checkout/viewmodels/cubits/payment_cubit/payment_cubit.dart';

void executeStripePayment(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '100',
    currency: 'USD',
    customerId: 'cus_Tp70Tk3gbZhWiq',
  );
  BlocProvider.of<PaymentCubit>(
    context,
  ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
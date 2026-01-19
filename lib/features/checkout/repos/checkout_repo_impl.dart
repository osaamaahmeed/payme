import 'package:dartz/dartz.dart';
import 'package:payme/core/utils/stripe_service.dart';
import 'package:payme/features/checkout/models/payment_intent_input_model.dart';
import 'package:payme/features/checkout/repos/checkout_repo.dart';

import '../../../core/errors/failures.dart';

class CheckoutRepoImpl extends CheckoutRepo{
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
import 'package:dio/dio.dart';
import 'package:payme/core/utils/api_keys.dart';
import 'package:payme/core/utils/api_service.dart';
import 'package:payme/features/checkout/models/payment_intent.dart';
import 'package:payme/features/checkout/models/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.stripeSecretKey,
    );
    var paymentIntent = PaymentIntentModel.fromJson(response.data);
    return paymentIntent;
  }

  Future initPaymentSheet ({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: "Osama Ahmed"
    ));
  }

  Future displayPaymentSheet () async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment ({required PaymentIntentInputModel paymentIntentInputModel}) async {
    // 1.
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    // 2.
    await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret);
    // 3.
    await displayPaymentSheet();
  }
}

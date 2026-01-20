import 'package:dio/dio.dart';
import 'package:payme/core/utils/api_keys.dart';
import 'package:payme/core/utils/api_service.dart';
import 'package:payme/features/checkout/models/ephemeral_key_model.dart';
import 'package:payme/features/checkout/models/payment_intent.dart';
import 'package:payme/features/checkout/models/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../features/checkout/models/init_payment_sheet_input_model.dart';

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

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        merchantDisplayName: "Osama Ahmed",
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    // 1.
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    // 2.
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = await InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    // 3.
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    // 4.
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.stripeSecretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
        'Stripe-Version': '2025-12-15.clover',
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}

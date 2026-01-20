class PaymentIntentInputModel {
  final String amount, currency, customerId;
  PaymentIntentInputModel({required this.amount, required this.currency, required this.customerId});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId, // might leave it nullable if my app support guest mode
    };
  }
}
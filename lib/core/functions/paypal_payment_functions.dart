import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../features/checkout/models/paypal_amount_model.dart';
import '../../features/checkout/models/paypal_items_list_model.dart';
import '../../features/checkout/view/thank_you_view.dart';
import '../utils/api_keys.dart';

void executePaypalPayment(
  BuildContext context,
  ({PaypalAmountModel amount, PaypalItemsListModel itemList}) transactionsData,
) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemList.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ThankYouView()),
            (route) {
              if (route.settings.name == '/') return true;
              return false;
            },
          );
        },
        onError: (error) {
          Navigator.pop(context);
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ),
  );
}

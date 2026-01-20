import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payme/core/utils/api_keys.dart';
import 'package:payme/features/checkout/models/payment_intent_input_model.dart';
import 'package:payme/features/checkout/models/paypal_amount_model.dart';
import 'package:payme/features/checkout/models/paypal_items_list_model.dart';

import '../../viewmodels/cubits/payment_cubit/payment_cubit.dart';
import '../thank_you_view.dart';
import 'custom_button.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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

  void executePaypalPayment(
    BuildContext context,
    ({PaypalAmountModel amount, PaypalItemsListModel itemList})
    transactionsData,
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
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }

  ({PaypalAmountModel amount, PaypalItemsListModel itemList})
  getTransactionsData() {
    var amount = PaypalAmountModel(
      currency: "USD",
      total: "200",
      details: Details(subtotal: "200", shipping: "0", shippingDiscount: 0),
    );
    var itemList = PaypalItemsListModel(
      items: [
        Item(name: "Banana", quantity: 5, price: "10", currency: "USD"),
        Item(name: "Soda", quantity: 3, price: "50", currency: "USD"),
      ],
    );
    return (amount: amount, itemList: itemList);
  }
}

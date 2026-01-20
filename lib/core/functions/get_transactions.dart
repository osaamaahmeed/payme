import '../../features/checkout/models/paypal_amount_model.dart';
import '../../features/checkout/models/paypal_items_list_model.dart';

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
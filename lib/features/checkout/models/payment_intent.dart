class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final AutomaticPaymentMethods automaticPaymentMethods;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String status;

  // Nullable fields
  final String? application;
  final int? applicationFeeAmount;
  final int? canceledAt;
  final String? cancellationReason;
  final String? customer;
  final String? description;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final dynamic nextAction;
  final String? onBehalfOf;
  final String? paymentMethod;
  final dynamic processing;
  final String? receiptEmail;
  final String? review;
  final String? setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final String? statementDescriptor;
  final String? statementDescriptorSuffix;
  final dynamic transferData;
  final String? transferGroup;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.automaticPaymentMethods,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.livemode,
    required this.metadata,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.status,
    this.application,
    this.applicationFeeAmount,
    this.canceledAt,
    this.cancellationReason,
    this.customer,
    this.description,
    this.lastPaymentError,
    this.latestCharge,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'],
      object: json['object'],
      amount: json['amount'],
      amountCapturable: json['amount_capturable'],
      amountDetails: AmountDetails.fromJson(json['amount_details']),
      amountReceived: json['amount_received'],
      automaticPaymentMethods:
      AutomaticPaymentMethods.fromJson(json['automatic_payment_methods']),
      captureMethod: json['capture_method'],
      clientSecret: json['client_secret'],
      confirmationMethod: json['confirmation_method'],
      created: json['created'],
      currency: json['currency'],
      livemode: json['livemode'],
      metadata: Map<String, dynamic>.from(json['metadata']),
      paymentMethodOptions:
      PaymentMethodOptions.fromJson(json['payment_method_options']),
      paymentMethodTypes:
      List<String>.from(json['payment_method_types']),
      status: json['status'],
      // application: json['application'],
      // applicationFeeAmount: json['application_fee_amount'],
      // canceledAt: json['canceled_at'],
      // cancellationReason: json['cancellation_reason'],
      // customer: json['customer'],
      // description: json['description'],
      // lastPaymentError: json['last_payment_error'],
      // latestCharge: json['latest_charge'],
      // nextAction: json['next_action'],
      // onBehalfOf: json['on_behalf_of'],
      // paymentMethod: json['payment_method'],
      // processing: json['processing'],
      // receiptEmail: json['receipt_email'],
      // review: json['review'],
      // setupFutureUsage: json['setup_future_usage'],
      // shipping: json['shipping'],
      // source: json['source'],
      // statementDescriptor: json['statement_descriptor'],
      // statementDescriptorSuffix: json['statement_descriptor_suffix'],
      // transferData: json['transfer_data'],
      // transferGroup: json['transfer_group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object': object,
      'amount': amount,
      'amount_capturable': amountCapturable,
      'amount_details': amountDetails.toJson(),
      'amount_received': amountReceived,
      'automatic_payment_methods': automaticPaymentMethods.toJson(),
      'capture_method': captureMethod,
      'client_secret': clientSecret,
      'confirmation_method': confirmationMethod,
      'created': created,
      'currency': currency,
      'livemode': livemode,
      'metadata': metadata,
      'payment_method_options': paymentMethodOptions.toJson(),
      'payment_method_types': paymentMethodTypes,
      'status': status,
    };
  }
}

class AmountDetails {
  final Map<String, dynamic> tip;

  AmountDetails({required this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: Map<String, dynamic>.from(json['tip']),
    );
  }

  Map<String, dynamic> toJson() => {'tip': tip};
}

class AutomaticPaymentMethods {
  final bool enabled;

  AutomaticPaymentMethods({required this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      enabled: json['enabled'],
    );
  }

  Map<String, dynamic> toJson() => {'enabled': enabled};
}

class PaymentMethodOptions {
  final CardOptions card;
  final LinkOptions link;

  PaymentMethodOptions({
    required this.card,
    required this.link,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: CardOptions.fromJson(json['card']),
      link: LinkOptions.fromJson(json['link']),
    );
  }

  Map<String, dynamic> toJson() => {
    'card': card.toJson(),
    'link': link.toJson(),
  };
}

class CardOptions {
  final dynamic installments;
  final dynamic mandateOptions;
  final String? network;
  final String requestThreeDSecure;

  CardOptions({
    this.installments,
    this.mandateOptions,
    this.network,
    required this.requestThreeDSecure,
  });

  factory CardOptions.fromJson(Map<String, dynamic> json) {
    return CardOptions(
      installments: json['installments'],
      mandateOptions: json['mandate_options'],
      network: json['network'],
      requestThreeDSecure: json['request_three_d_secure'],
    );
  }

  Map<String, dynamic> toJson() => {
    'installments': installments,
    'mandate_options': mandateOptions,
    'network': network,
    'request_three_d_secure': requestThreeDSecure,
  };
}

class LinkOptions {
  final String? persistentToken;

  LinkOptions({this.persistentToken});

  factory LinkOptions.fromJson(Map<String, dynamic> json) {
    return LinkOptions(
      persistentToken: json['persistent_token'],
    );
  }

  Map<String, dynamic> toJson() => {
    'persistent_token': persistentToken,
  };
}

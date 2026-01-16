import 'package:flutter/material.dart';
import 'package:payme/features/checkout/view/thank_you_view.dart';
import 'package:payme/features/checkout/view/widgets/custom_button.dart';
import 'package:payme/features/checkout/view/widgets/custom_credit_card_widget.dart';
import 'package:payme/features/checkout/view/widgets/payment_methods_section.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PaymentMethodsSection(),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCardWidget(
            formKey: formKey,
            autoValidateMode: autoValidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(text: "Pay", onTap: (){
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThankYouView()));
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },),
            ),
          ),
        ),
      ],
    );
  }
}

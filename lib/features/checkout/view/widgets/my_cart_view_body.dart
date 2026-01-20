import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payme/features/checkout/repos/checkout_repo.dart';
import 'package:payme/features/checkout/repos/checkout_repo_impl.dart';
import 'package:payme/features/checkout/view/widgets/numbers_section.dart';
import 'package:payme/features/checkout/view/widgets/payment_methods_section.dart';
import 'package:payme/features/checkout/view/widgets/payment_option_bottom_sheet.dart';
import 'package:payme/features/checkout/viewmodels/cubits/payment_cubit/payment_cubit.dart';
import 'custom_button.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Image.asset(
                  "assets/images/cart_pic.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const NumbersSection(),
            const SizedBox(height: 16),
            CustomButton(
              text: "Complete Payment",
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BlocProvider(
                    create: (_) => PaymentCubit(CheckoutRepoImpl()),
                    child: const PaymentOptionsBottomSheet(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

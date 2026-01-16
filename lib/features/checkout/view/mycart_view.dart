import 'package:flutter/material.dart';
import 'package:payme/core/widgets/custom_app_bar.dart';
import 'package:payme/features/checkout/view/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'MyCart',),
      body: const MyCartViewBody(),
    );
  }
}

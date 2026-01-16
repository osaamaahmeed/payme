import 'package:flutter/material.dart';
import 'package:payme/core/widgets/custom_app_bar.dart';
import 'package:payme/features/checkout/view/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      body: Transform.translate(offset: Offset(0, 0), child: const ThankYouViewBody()),
    );
  }
}

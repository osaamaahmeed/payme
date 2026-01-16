import 'package:flutter/material.dart';
import 'package:payme/core/theme/app_styles.dart';

class ThankYouHeaderSection extends StatelessWidget {
  const ThankYouHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Thank You!", style: AppStyles.style25),
        Text(
          "Your transaction was successful",
          style: AppStyles.style20,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payme/core/theme/app_styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(23),
            child: Image.asset(
              "assets/images/mastercardLogo.png",
              width: 35,
            ),
          ),
          const SizedBox(width: 9),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Credit Card", style: AppStyles.style18),
              Text("Mastercard **78", style: AppStyles.style18),
            ],
          ),
        ],
      ),
    );
  }
}

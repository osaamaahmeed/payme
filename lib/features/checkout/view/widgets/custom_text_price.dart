import 'package:flutter/material.dart';
import 'package:payme/core/theme/app_styles.dart';

class CustomTextPrice extends StatelessWidget {
  const CustomTextPrice({super.key, required this.text, required this.price, this.total});
  final String text,price;
  final bool ?total;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: total != null ? AppStyles.style24 : AppStyles.style18
          // style: TextStyle(fontSize: total!=null ? 24 : 18, fontWeight: total!=null ? FontWeight.w600 : FontWeight.w400),
        ),
        Text(
          price,
            style: total != null ? AppStyles.style24 : AppStyles.style18
          // style: TextStyle(fontSize: total!=null ? 24 : 18, fontWeight: total!=null ? FontWeight.w600 : FontWeight.w400),
        ),
      ],
    );
  }
}

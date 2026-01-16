import 'package:flutter/material.dart';

class CustomDottedDivider extends StatelessWidget {
  const CustomDottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        300 ~/ 5, // Split width (approx) by dash width + space
            (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.grey : Colors.transparent,
            height: 2,
          ),
        ),
      ),
    );
  }
}

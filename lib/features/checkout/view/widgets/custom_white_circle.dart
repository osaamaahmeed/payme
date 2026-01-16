import 'package:flutter/material.dart';

class CustomWhiteCircle extends StatelessWidget {
  const CustomWhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

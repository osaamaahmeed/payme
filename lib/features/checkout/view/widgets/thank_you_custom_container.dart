import 'package:flutter/material.dart';

class ThankYouCustomContainer extends StatelessWidget {
  const ThankYouCustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          width: double.infinity,
          // height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 55),
          padding: EdgeInsets.only(left: 20, right: 20, top: 55),
          child: child
      ),
    );
  }
}

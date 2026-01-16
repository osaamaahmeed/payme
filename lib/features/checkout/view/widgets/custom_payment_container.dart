import 'package:flutter/material.dart';

class CustomPaymentContainer extends StatelessWidget {
  const CustomPaymentContainer({
    super.key,
    required this.image,
    this.isSelected = false,
  });
  final String image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: 104,
        height: 62,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Color(0xFF34A853),
                offset: Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
              ),
          ],
          border: Border.all(
            color: isSelected ? Color(0xFF34A853) : Colors.grey,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Image.asset(
          image,
          // fit: BoxFit.scaleDown
          ),
      ),
    );
  }
}

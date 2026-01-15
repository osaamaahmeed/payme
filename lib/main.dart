import 'package:flutter/material.dart';
import 'package:payme/view/mycart_view.dart';

void main () {
  runApp(const Payme());
}

class Payme extends StatelessWidget {
  const Payme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyCartView(),
    );
  }
}

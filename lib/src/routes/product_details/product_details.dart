import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: Placeholder()),
            QNavigationBar(),
          ],
        ),
      ),
    );
  }
}

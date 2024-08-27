import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/screens/home/features/product_list/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: const ProductList(),
    );
  }
}

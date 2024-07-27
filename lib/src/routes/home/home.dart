import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/routes/home/features/home_app_bar.dart';
import 'package:que_based_ecom_fe/src/routes/home/features/product_list/product_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final appBar = HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return const ProductList();
  }
}

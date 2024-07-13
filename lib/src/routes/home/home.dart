import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/routes/home/features/product_list.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProductList(),
                ),
                QNavigationBar()
              ],
            ),
          ),
        ));
  }
}

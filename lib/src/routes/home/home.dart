import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/routes/home/features/product_list.dart';
import 'package:que_based_ecom_fe/src/routes/home/home_store.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  void shopOrWarehouseSwitchOnChanged(bool value) {
    HomeStore state = June.getState(() => HomeStore());
    state.toggleIsShop(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: JuneBuilder(
                () => HomeStore(),
                builder: (state) => Row(
                  children: [
                    Switch(
                      value: state.isShop,
                      onChanged: shopOrWarehouseSwitchOnChanged,
                      inactiveTrackColor: Colors.pink.shade900,
                      thumbColor: WidgetStateProperty.all(Colors.black),
                      activeColor: Colors.greenAccent,
                    ),
                    Icon(state.isShop ? Icons.store : Icons.warehouse),
                  ],
                ),
              ),
            )
          ],
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

import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key});

  void shopOrWarehouseSwitchOnChanged(bool value) {
    HomeProductDetailStore state =
        June.getState(() => HomeProductDetailStore());
    state.toggleIsShop(value);
  }

  @override
  Widget? get title => const Text('Products');

  @override
  List<Widget>? get actions => [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: JuneBuilder(
            () => HomeProductDetailStore(),
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
      ];
}

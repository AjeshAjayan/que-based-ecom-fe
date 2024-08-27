import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';

class HomeAppBar extends AppBar {
  HomeAppBar(
      {super.key, required this.onIsShopToggle, required this.onSignInClick});

  final void Function(bool) onIsShopToggle;
  final void Function() onSignInClick;

  @override
  Widget? get title => TextButton(
        onPressed: onSignInClick,
        child: const SizedBox(
          width: 80,
          child: Row(
            children: [
              Icon(Icons.login),
              SizedBox(
                width: 5,
              ),
              Text('Sign In'),
            ],
          ),
        ),
      );

  void shopOrWarehouseSwitchOnChanged(bool value) {
    HomeProductDetailStore state =
        June.getState(() => HomeProductDetailStore());
    state.toggleIsShop(value);
  }

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

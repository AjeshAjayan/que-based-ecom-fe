import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/store/profile_store.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
    required this.onIsShopToggle,
    required this.onSignInClick,
  });

  final void Function(bool) onIsShopToggle;
  final void Function() onSignInClick;

  @override
  List<Widget>? get actions => [
        JuneBuilder(() => ProfileStore(), builder: (state) {
          return !state.isSignedIn
              ? TextButton(
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
                )
              : const SizedBox.shrink();
        })
      ];

  void shopOrWarehouseSwitchOnChanged(bool value) {
    HomeProductDetailStore state =
        June.getState(() => HomeProductDetailStore());
    state.toggleIsShop(value);
  }

  @override
  Widget? get title => Container(
        margin: const EdgeInsets.only(right: 15),
        child: JuneBuilder(
          () => HomeProductDetailStore(),
          builder: (state) => Row(
            children: [
              Icon(state.isShop ? Icons.store : Icons.warehouse),
              const SizedBox(width: 5),
              Switch(
                value: state.isShop,
                onChanged: shopOrWarehouseSwitchOnChanged,
                inactiveTrackColor: Colors.pink.shade900,
                thumbColor: WidgetStateProperty.all(Colors.black),
                activeColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
      );
}

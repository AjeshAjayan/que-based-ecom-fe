import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class ShellRouteWithNavigation extends StatelessWidget {
  const ShellRouteWithNavigation({super.key, required this.child, this.appBar});

  final Widget child;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: child,
              ),
              const QNavigationBar()
            ],
          ),
        ),
      ),
    );
  }
}

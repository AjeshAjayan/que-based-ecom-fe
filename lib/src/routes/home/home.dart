import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              QNavigationBar()
            ],
          ),
        ));
  }
}

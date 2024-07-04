import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/routes/login/login.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginRoute(),
        ),
      );
    });

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

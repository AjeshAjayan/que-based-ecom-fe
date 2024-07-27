import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:que_based_ecom_fe/router/shell_route_with_navigation.dart';
import 'package:que_based_ecom_fe/src/routes/home/home.dart';
import 'package:que_based_ecom_fe/src/routes/login/login.dart';
import 'package:que_based_ecom_fe/src/routes/product_details/product_details.dart';
import 'package:que_based_ecom_fe/src/routes/register/register.dart';
import 'package:que_based_ecom_fe/src/routes/verify_otp/verify_otp.dart';

import '../src/routes/home/features/home_app_bar.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        if (state.fullPath == '/home') {
          return ShellRouteWithNavigation(
            appBar: HomeAppBar(),
            child: child,
          );
        }

        return ShellRouteWithNavigation(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) => LoginRoute(),
        ),
        GoRoute(
          path: '/verify-otp/:phoneNumber',
          builder: (BuildContext context, GoRouterState state) =>
              VerifyOTPRoute(
            phoneNumber: state.pathParameters['phoneNumber'] ?? '',
          ),
        ),
        GoRoute(
          path: '/register',
          builder: (BuildContext context, GoRouterState state) =>
              const RegisterRoute(),
        ),
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) => HomeScreen(),
        ),
        GoRoute(
          path: '/product-details',
          builder: (BuildContext context, GoRouterState state) =>
              const ProductDetailsRoute(),
        )
      ],
    ),
  ],
);

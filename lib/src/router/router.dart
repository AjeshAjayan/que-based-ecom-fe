import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/router/shell_route_with_navigation.dart';
import 'package:que_based_ecom_fe/src/screens/home/features/product_list/command/fetch_products.dart';
import 'package:que_based_ecom_fe/src/screens/home/home.dart';
import 'package:que_based_ecom_fe/src/screens/login/login.dart';
import 'package:que_based_ecom_fe/src/screens/my_trade/my_trade.dart';
import 'package:que_based_ecom_fe/src/screens/orders/orders.dart';
import 'package:que_based_ecom_fe/src/screens/product_details/product_details.dart';
import 'package:que_based_ecom_fe/src/screens/profile/profile.dart';
import 'package:que_based_ecom_fe/src/screens/register/register.dart';
import 'package:que_based_ecom_fe/src/screens/verify_otp/verify_otp.dart';
import 'package:que_based_ecom_fe/src/store/profile_store.dart';

import '../screens/home/features/home_app_bar.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => LoginScreen(),
    ),
    GoRoute(
      path: '/verify-otp/:phoneNumber',
      builder: (BuildContext context, GoRouterState state) => VerifyOTPScreen(
        phoneNumber: state.pathParameters['phoneNumber'] ?? '',
      ),
    ),
    GoRoute(
      path: '/register/:phoneNumber',
      builder: (BuildContext context, GoRouterState state) => RegisterScreen(
        phoneNumber: state.pathParameters['phoneNumber'] ?? '',
      ),
    ),
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        if (state.fullPath == '/home') {
          return ShellRouteWithNavigation(
            appBar: HomeAppBar(
              onIsShopToggle: (value) {
                fetchProducts(context, value);
              },
              onSignInClick: () {
                context.go('/login');
              },
            ),
            child: child,
          );
        }

        if (state.fullPath == '/home/product-details' ||
            state.fullPath == '/orders' ||
            state.fullPath == '/profile' ||
            state.fullPath == '/my-trade') {
          return ShellRouteWithNavigation(
            child: child,
          );
        }

        return ShellRouteWithNavigation(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) =>
              const HomeScreen(),
          routes: [
            GoRoute(
              path: 'product-details',
              builder: (BuildContext context, GoRouterState state) =>
                  const ProductDetailsScreen(),
            )
          ],
        ),
        GoRoute(
          path: '/orders',
          builder: (BuildContext context, GoRouterState state) =>
              const OrdersScreen(),
        ),
        GoRoute(
          path: '/my-trade',
          builder: (BuildContext context, GoRouterState state) =>
              const MyTradeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) =>
              const ProfileScreen(),
        ),
      ],
    ),
  ],
);

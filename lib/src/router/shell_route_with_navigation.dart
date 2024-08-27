import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/shell_route_with_navigation_store.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class ShellRouteWithNavigation extends StatelessWidget {
  const ShellRouteWithNavigation({super.key, required this.child, this.appBar});

  final Widget child;
  final AppBar? appBar;

  void _handleOnDestinationSelected(int selectedIndex, BuildContext context) {
    switch (selectedIndex) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/orders');
        break;
      case 2:
        context.go('/my-trade');
        break;
      case 3:
        context.go('/profile');
        break;
    }

    final state = June.getState(() => ShellRouteWithNavigationStore());
    state.updateSelectedIndex(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: child,
            ),
            JuneBuilder(() => ShellRouteWithNavigationStore(),
                builder: (state) {
              return QNavigationBar(
                selectedIndex: state.selectedIndex,
                onDestinationSelected: (index) =>
                    _handleOnDestinationSelected(index, context),
              );
            })
          ],
        ),
      ),
    );
  }
}

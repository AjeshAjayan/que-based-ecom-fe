import 'package:flutter/material.dart';

class QNavigationBar extends StatefulWidget {
  const QNavigationBar({
    super.key,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  final void Function(int) onDestinationSelected;
  final int selectedIndex;

  @override
  State<QNavigationBar> createState() => _QNavigationBarState();
}

class _QNavigationBarState extends State<QNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: widget.onDestinationSelected,
      selectedIndex: widget.selectedIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.local_shipping),
          icon: Badge(child: Icon(Icons.local_shipping_outlined)),
          label: 'Orders',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.currency_rupee),
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.currency_rupee_outlined),
          ),
          label: 'My Trade',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person_2),
          icon: Badge(
            child: Icon(Icons.person_2_outlined),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

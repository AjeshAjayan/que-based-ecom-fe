import 'package:flutter/material.dart';

class QNavigationBar extends StatefulWidget {
  const QNavigationBar({super.key});

  @override
  State<QNavigationBar> createState() => _QNavigationBarState();
}

class _QNavigationBarState extends State<QNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.messenger_sharp),
          ),
          label: 'Messages',
        ),
      ],
    );
  }
}

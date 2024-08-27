import 'package:june/june.dart';

class ShellRouteWithNavigationStore extends JuneState {
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    setState();
  }
}

import 'package:june/june.dart';

class HomeStore extends JuneState {
  bool isShop = false;

  void toggleIsShop(bool value) {
    isShop = value;
    setState();
  }
}

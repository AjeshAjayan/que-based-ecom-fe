import 'package:june/june.dart';

class HomeProductDetailStore extends JuneState {
  bool isShop = false;

  void toggleIsShop(bool value) {
    isShop = value;
    setState();
  }
}

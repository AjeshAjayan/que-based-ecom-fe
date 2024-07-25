import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/model/product/product.dart';

class HomeProductDetailStore extends JuneState {
  bool isShop = false;
  List<Product> products = [];
  Product? selectedProduct;

  updateProducts(List<Product> products) {
    products = products;
    setState();
  }

  updateSelectedProduct(Product? product) {
    selectedProduct = product;
    setState();
  }

  void toggleIsShop(bool value) {
    isShop = value;
    setState();
  }
}

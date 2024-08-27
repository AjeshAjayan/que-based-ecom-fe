import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/model/product/product.dart';

class HomeProductDetailStore extends JuneState {
  bool isShop = false;
  bool isLoading = false;
  List<Product> products = [];
  Product? selectedProduct;

  updateIsLoading(bool isLoadingArg) {
    isLoading = isLoadingArg;
    setState();
  }

  updateProductsAndLoading(List<Product> products, bool isLoadingArg) {
    isLoading = isLoadingArg;
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

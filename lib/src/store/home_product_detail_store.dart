import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/model/product/product.dart';

class HomeProductDetailStore extends JuneState {
  bool isShop = false;
  bool isLoading = false;
  List<Product> products = [];
  Product? selectedProduct;
  bool hasError = false;

  void updateHasError(bool hasErrorArg) {
    isLoading = !hasErrorArg;
    hasError = hasErrorArg;
    setState();
  }

  updateIsLoading(bool isLoadingArg) {
    isLoading = isLoadingArg;
    setState();
  }

  updateProductsAndLoading(List<Product> productsArg, bool isLoadingArg) {
    isLoading = isLoadingArg;
    products = productsArg;
    setState();
  }

  updateSelectedProduct(Product? productArg) {
    selectedProduct = productArg;
    setState();
  }

  void toggleIsShop(bool value) {
    isShop = value;
    setState();
  }
}

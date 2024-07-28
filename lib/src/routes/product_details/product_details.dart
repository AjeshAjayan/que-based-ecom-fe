import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void dispose() {
    /**
     * cleaning state
     */
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());
    homeProductDetailStore.updateSelectedProduct(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      () => HomeProductDetailStore(),
      builder: (state) {
        if (state.selectedProduct != null) {
          final selectedProduct = state.selectedProduct!;

          return Center(
            child: Text(selectedProduct.title),
          );
        }

        return const Center(child: Text('Ops, something went wrong'));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/widgets/q_navigation_bar.dart';

class ProductDetailsRoute extends StatefulWidget {
  const ProductDetailsRoute({super.key});

  @override
  State<ProductDetailsRoute> createState() => _ProductDetailsRouteState();
}

class _ProductDetailsRouteState extends State<ProductDetailsRoute> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
                if (state.selectedProduct != null) {
                  final selectedProduct = state.selectedProduct!;

                  return Center(
                    child: Text(selectedProduct.title),
                  );
                }

                return const Center(child: Text('Ops, something went wrong'));
              }),
            ),
            const QNavigationBar(),
          ],
        ),
      ),
    );
  }
}

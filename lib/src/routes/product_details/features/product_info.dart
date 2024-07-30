import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/get_days_ago.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
      return Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${state.selectedProduct?.price != null ? '\$' : ''} ${state.selectedProduct?.price.toString() ?? ''}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Visibility(
                  visible: state.selectedProduct!.moq > 1,
                  child: Text(
                    'MOQ ${state.selectedProduct?.moq.toString() ?? ''}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Text(getDaysAgo(state.selectedProduct?.productAddedDate ?? ''))
          ],
        ),
      );
    });
  }
}

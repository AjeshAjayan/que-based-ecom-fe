import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/model/payload_description/payload_description.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/find_all_medias_from_product.dart';
import 'package:que_based_ecom_fe/src/utils/get_days_ago.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  List<String> videos = [];
  List<String> images = [];

  @override
  void initState() {
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());

    if (homeProductDetailStore.selectedProduct != null) {
      final media =
          findAllMediasFromProduct(homeProductDetailStore.selectedProduct!);
      setState(() {
        videos = media.videos;
        images = media.images;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
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
              Text(getDaysAgo(state.selectedProduct?.productAddedDate ?? '')),
              Text(
                state.selectedProduct?.description?[0].children
                        .map((PayloadDescriptionChild dc) => dc.text)
                        .join() ??
                    '',
              ),
            ],
          ),
        ),
      );
    });
  }
}

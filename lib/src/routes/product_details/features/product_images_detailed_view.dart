import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/constants.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/find_all_medias_from_product.dart';

class ProductImageDetailedView extends StatefulWidget {
  const ProductImageDetailedView({super.key});

  @override
  State<ProductImageDetailedView> createState() =>
      _ProductImageDetailedViewState();
}

class _ProductImageDetailedViewState extends State<ProductImageDetailedView> {
  List<String> images = [];

  @override
  void initState() {
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());

    if (homeProductDetailStore.selectedProduct != null) {
      final media =
          findAllMediasFromProduct(homeProductDetailStore.selectedProduct!);
      setState(() {
        images = media.images;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                assetUrl + images[index],
                fit: BoxFit.cover,
                loadingBuilder: (context, widget, imageChunkEvent) {
                  if (imageChunkEvent == null) {
                    return widget; // Return a blank space while loading the image.
                  } // Return a blank space while loading the image.
                  return const SizedBox(
                    width: double.infinity,
                    height: 86,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          );
        },
        childCount: images.length,
      ),
    );
  }
}

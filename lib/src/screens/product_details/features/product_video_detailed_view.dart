import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/constants.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/find_all_medias_from_product.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_video.dart';

class ProductVideoDetailedView extends StatefulWidget {
  const ProductVideoDetailedView({super.key});

  @override
  State<ProductVideoDetailedView> createState() =>
      _ProductVideoDetailedViewState();
}

class _ProductVideoDetailedViewState extends State<ProductVideoDetailedView> {
  List<String> videos = [];

  @override
  void initState() {
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());

    if (homeProductDetailStore.selectedProduct != null) {
      final media =
          findAllMediasFromProduct(homeProductDetailStore.selectedProduct!);
      setState(() {
        videos = media.videos;
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
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: QProductVideo(
              networkURL: assetUrl + videos[index],
              onError: () => {
                /// TODO: implement error
              },
            ),
          );
        },
        childCount: videos.length,
      ),
    );
  }
}

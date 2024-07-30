import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/routes/product_details/features/product_images_detailed_view.dart';
import 'package:que_based_ecom_fe/src/routes/product_details/features/product_info.dart';
import 'package:que_based_ecom_fe/src/routes/product_details/features/product_video_detailed_view.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/find_all_medias_from_product.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_media_carousel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> mediaURLs = [];

  @override
  void initState() {
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());

    if (homeProductDetailStore.selectedProduct != null) {
      final media =
          findAllMediasFromProduct(homeProductDetailStore.selectedProduct!);
      setState(() {
        mediaURLs = [...media.images, ...media.videos];
      });
    }
    super.initState();
  }

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
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          pinned: true,
          stretch: true,
          expandedHeight: 320,
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            double top = constraints.biggest.height;
            return JuneBuilder(() => HomeProductDetailStore(),
                builder: (state) {
              return FlexibleSpaceBar(
                  title: top <= 80
                      ? Text(state.selectedProduct?.title ?? '')
                      : null,
                  background: QProductMediaCarousel(mediaURLs: mediaURLs));
            });
          }),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: const ProductInfo(),
                  ),
                )
              ],
            ),
          ),
        ),
        const ProductImageDetailedView(),
        const ProductVideoDetailedView(),
      ],
    );
  }
}

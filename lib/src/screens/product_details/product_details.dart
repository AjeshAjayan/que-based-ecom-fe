import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/screens/product_details/features/product_images_detailed_view.dart';
import 'package:que_based_ecom_fe/src/screens/product_details/features/product_info.dart';
import 'package:que_based_ecom_fe/src/screens/product_details/features/product_media_full_screen.dart';
import 'package:que_based_ecom_fe/src/screens/product_details/features/product_video_detailed_view.dart';
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

  _handleFullScreenOnPress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductMediaFullScreen(mediaURLs: mediaURLs),
        fullscreenDialog: true,
      ),
    );
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
          actions: [
            IconButton(
              onPressed: _handleFullScreenOnPress,
              icon: const Icon(Icons.fullscreen),
            ),
          ],
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            double top = constraints.biggest.height;
            return JuneBuilder(() => HomeProductDetailStore(),
                builder: (state) {
              return FlexibleSpaceBar(
                  title: top <= 80
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Text(
                            state.selectedProduct?.title ?? '',
                            softWrap: false,
                          ),
                        )
                      : null,
                  background: QProductMediaCarousel(mediaURLs: mediaURLs));
            });
          }),
        ),
        const SliverToBoxAdapter(
          child: ProductInfo(),
        ),
        const ProductImageDetailedView(),
        const ProductVideoDetailedView(),
      ],
    );
  }
}

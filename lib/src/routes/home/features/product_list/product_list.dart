import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:que_based_ecom_fe/src/api/get_all_moq_1_products.dart';
import 'package:que_based_ecom_fe/src/api/get_all_products.dart';
import 'package:que_based_ecom_fe/src/routes/product_details/product_details.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_media_carousel.dart';

import '../../../../model/product/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
  }

  findAllImagesAndVideos(List<Product> products, int index) {
    /**
     * get images and videos from top level
     */
    final images = products[index]
        .imagesAndVideos
        .map((media) => media.image?.url ?? '')
        .where((url) => url != '')
        .toList();

    final videos = products[index]
        .imagesAndVideos
        .map((media) => media.video?.url ?? '')
        .where((url) => url != '')
        .toList();
    /**
     * END: get images and videos from top level
     */

    /**
     * get images and videos from all variant levels
     */
    products[index].variants?.asMap().entries.map((entries) {
      final variant = entries.value;
      final imageUrls = variant.imagesAndVideos
          .map((media) => media.image?.url ?? '')
          .where((url) => url != '')
          .toList();
      final videoUrls = variant.imagesAndVideos
          .map((media) => media.video?.url ?? '')
          .where((url) => url != '')
          .toList();

      images.addAll(imageUrls);
      videos.addAll(videoUrls);
    });
    /**
     * END: get images and videos from all variant levels
     */

    return [...videos, ...images];
  }

  // void _updateProducts(List<Product> products) {
  //   final homeProductDetailStore =
  //       June.getState(() => HomeProductDetailStore());

  //   homeProductDetailStore.updateProducts(products);
  // }

  void _updateSelectedProduct(Product product) {
    final homeProductDetailStore =
        June.getState(() => HomeProductDetailStore());

    homeProductDetailStore.updateSelectedProduct(product);
  }

  void _handleProductOnTap(Product product) {
    _updateSelectedProduct(product);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductDetailsRoute(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: refactor to use JuneBuilder only; do not use FutureBuilder;
    return JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
      return FutureBuilder(
        future: state.isShop
            ? getAllMOQ1Products(
                context,
                // TODO: remove
                // onComplete: (responseWithPaginatedProducts) => _updateProducts(
                //   responseWithPaginatedProducts.data?.docs ?? [],
                // ),
              )
            : getAllProducts(
                context,
                // TODO: remove
                // onComplete: (responseWithPaginatedProducts) => _updateProducts(
                //   responseWithPaginatedProducts.data?.docs ?? [],
                // ),
              ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final listCount = snapshot.data?.data?.totalDocs ?? 0;
            final products = snapshot.data?.data?.docs;

            if (snapshot.error != null) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            if (listCount == 0 || products == null) {
              return const Center(
                child: Text('No Products'),
              );
            }

            return ListView.builder(
              itemCount: listCount,
              itemBuilder: (context, index) {
                final mediaURLs = findAllImagesAndVideos(products, index);

                return GestureDetector(
                  onTap: () => _handleProductOnTap(products[index]),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Card.outlined(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                QProductMediaCarousel(
                                  mediaURLs: mediaURLs,
                                ),
                                Visibility(
                                  visible: products[index].moq > 1,
                                  child: Positioned(
                                    left: MediaQuery.of(context).size.width / 7,
                                    top: 10,
                                    child: LinearPercentIndicator(
                                      alignment: MainAxisAlignment.center,
                                      barRadius: const Radius.circular(10),
                                      width: 260.0,
                                      lineHeight: 20.0,
                                      center: Text(
                                        'Que is filling ${products[index].moq - 5} more to go',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      percent: 0.5,
                                      backgroundColor: const Color.fromARGB(
                                          255, 116, 116, 116),
                                      progressColor: const Color.fromARGB(
                                          255, 109, 175, 32),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          products[index].title,
                                        ),
                                        const SizedBox(height: 5),
                                        Visibility(
                                          visible: products[index].moq > 1,
                                          child: const Text('In Queue: 3'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          '₹${products[index].price}',
                                        ),
                                        const SizedBox(height: 5),
                                        Visibility(
                                          visible: products[index].moq > 1,
                                          child: Text(
                                            'MOQ: ${products[index].moq}',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    });
  }
}

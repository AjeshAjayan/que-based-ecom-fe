import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:june/june.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:que_based_ecom_fe/src/screens/home/features/product_list/command/fetch_products.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';
import 'package:que_based_ecom_fe/src/utils/find_all_medias_from_product.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_media_carousel.dart';

import '../../../../model/product/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final homeProductDetailState = June.getState(() => HomeProductDetailStore());
  @override
  void initState() {
    /**
     * call API if product is empty. This is a simple
     * caching mechanism. The caching is happening in the store
     * itself.
     */
    if (homeProductDetailState.products.isEmpty) {
      fetchProducts(context, null);
    }
    super.initState();
  }

  void _updateSelectedProduct(Product product) {
    final homeProductDetailState =
        June.getState(() => HomeProductDetailStore());

    homeProductDetailState.updateSelectedProduct(product);
  }

  void _handleProductOnTap(Product product) {
    _updateSelectedProduct(product);

    context.push('/home/product-details');
  }

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(() => HomeProductDetailStore(), builder: (state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state.products.isEmpty) {
        return const Center(
          child: Text('No Products'),
        );
      }

      if (state.hasError) {
        return const Center(
          child: Text('Something went wrong'),
        );
      }

      return ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final media = findAllMediasFromProduct(state.products[index]);
          final mediaURLs = [...media.images, ...media.videos];

          return GestureDetector(
            onTap: () => _handleProductOnTap(state.products[index]),
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
                            visible: state.products[index].moq > 1,
                            child: Positioned(
                              left: MediaQuery.of(context).size.width / 7,
                              top: 10,
                              child: LinearPercentIndicator(
                                alignment: MainAxisAlignment.center,
                                barRadius: const Radius.circular(10),
                                width: 260.0,
                                lineHeight: 20.0,
                                center: Text(
                                  'Que is filling ${state.products[index].moq - 5} more to go',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                percent: 0.5,
                                backgroundColor:
                                    const Color.fromARGB(255, 116, 116, 116),
                                progressColor:
                                    const Color.fromARGB(255, 109, 175, 32),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    state.products[index].title,
                                  ),
                                  const SizedBox(height: 5),
                                  Visibility(
                                    visible: state.products[index].moq > 1,
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
                                    '₹${state.products[index].price}',
                                  ),
                                  const SizedBox(height: 5),
                                  Visibility(
                                    visible: state.products[index].moq > 1,
                                    child: Text(
                                      'MOQ: ${state.products[index].moq}',
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
    });
  }
}

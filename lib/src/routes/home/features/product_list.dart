import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/get_all_products.dart';
import 'package:que_based_ecom_fe/src/widgets/q_product_media_carousel.dart';

import '../../../model/paginated/paginated.dart';
import '../../../model/product/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<Response<Paginated<Product>>> productsFuture;

  @override
  void initState() {
    productsFuture = getAllProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final listCount = snapshot.data?.data?.totalDocs ?? 0;
          final products = snapshot.data?.data?.docs;

          if (listCount == 0 || products == null) {
            return const Center(
              child: Text('No Products'),
            );
          }

          return ListView.builder(
            itemCount: listCount,
            itemBuilder: (context, index) {
              final images = products[index]
                  .imagesAndVideos
                  .map((media) => media.image?.url ?? '')
                  .toList();

              final videos = products[index]
                  .imagesAndVideos
                  .map((media) => media.video?.url ?? '')
                  .toList();

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Card.outlined(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QProductMediaCarousel(
                        mediaURLs: videos + images,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                products[index].title,
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
                                  Text(
                                    'MOQ: ${products[index].moq}',
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
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// TODO: tweek product model to support image and video array, get all relavent details from API
// TODO: integrate to home page
// TODO: implement tabs
// TODO: navigate to detail page

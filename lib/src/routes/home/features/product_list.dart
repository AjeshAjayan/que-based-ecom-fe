import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/get_all_products.dart';

import '../../../model/paginated.dart';
import '../../../model/product.dart';

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

          if (listCount == 0) {
            return const Center(
              child: Text('No Products'),
            );
          }

          return ListView.builder(
            itemCount: listCount,
            itemBuilder: (context, index) {
              return Card.outlined(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Placeholder(),
                        Text(
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          snapshot.data?.data?.docs[index].title ?? 'No Title',
                        )
                      ],
                    )),
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

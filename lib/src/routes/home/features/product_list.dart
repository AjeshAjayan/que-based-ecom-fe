import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/get_all_products.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final productsFuture = getAllProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final listCount = snapshot.data?.products?.totalDocs ?? 0;

          if (listCount == 0) {
            return const Center(
              child: Text('No Products'),
            );
          }

          return ListView.builder(
            itemCount: listCount,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    snapshot.data?.products?.docs[index].title ?? 'No Title'),
                subtitle: const Text('description'),
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

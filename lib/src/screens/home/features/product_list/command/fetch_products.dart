import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/api/get_all_moq_1_products.dart';
import 'package:que_based_ecom_fe/src/api/get_all_products.dart';
import 'package:que_based_ecom_fe/src/model/paginated/paginated.dart';
import 'package:que_based_ecom_fe/src/model/product/product.dart';
import 'package:que_based_ecom_fe/src/store/home_product_detail_store.dart';

Future<void> fetchProducts(BuildContext context, bool? isShop) async {
  Paginated<Product>? products;
  final state = June.getState(() => HomeProductDetailStore());

  state.updateIsLoading(true);

  if (state.isShop || (isShop ?? false)) {
    final response = await getAllMOQ1Products(context);
    products = response.data;
  } else {
    final response = await getAllProducts(context);
    products = response.data;
  }
  state.updateProductsAndLoading(products?.docs ?? [], false);
}

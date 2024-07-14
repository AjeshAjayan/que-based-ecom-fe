import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';
import 'package:que_based_ecom_fe/src/model/paginated.dart';
import 'package:que_based_ecom_fe/src/model/product.dart';

Future<Response<Paginated<Product>>> getAllProducts(
  BuildContext buildContext,
) async {
  try {
    final dioClient = DioClient(buildContext);

    final response = await dioClient.dio.get('api/products');
    Paginated<Product>? paginatedProducts =
        Paginated.fromJSON(response.data, (object) {
      dynamic data = object;
      return Product(data?['title']);
    });

    Response<Paginated<Product>> responseWithPaginatedProducts =
        Response<Paginated<Product>>(
      data: paginatedProducts,
      requestOptions: response.requestOptions,
    );
    return responseWithPaginatedProducts;
  } catch (e) {
    rethrow;
  }
}

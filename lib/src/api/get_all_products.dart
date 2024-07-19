import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';
import 'package:que_based_ecom_fe/src/model/paginated/paginated.dart';
import 'package:que_based_ecom_fe/src/model/product/product.dart';

Future<Response<Paginated<Product>>> getAllProducts(
  BuildContext buildContext,
) async {
  try {
    final dioClient = DioClient(buildContext);

    final response = await dioClient.dio.get('api/products');
    Paginated<Product>? paginatedProducts =
        Paginated.fromJSON(response.data, (object) {
      dynamic data = object;
      return Product(
        title: data?['title'],
        price: data?['price'],
        id: data?['id'],
        moq: data?['moq'],
        productAddedDate: data?['productAddedDate'],
        images: [],
        subCategory: [],
      );
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

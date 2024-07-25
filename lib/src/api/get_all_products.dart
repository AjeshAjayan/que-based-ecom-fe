import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';
import 'package:que_based_ecom_fe/src/model/paginated/paginated.dart';
import 'package:que_based_ecom_fe/src/model/product/product.dart';

typedef OnCompleteFunction = void Function(
    Response<Paginated<Product>> responseWithPaginatedProducts);

Future<Response<Paginated<Product>>> getAllProducts(BuildContext buildContext,
    {OnCompleteFunction? onComplete}) async {
  try {
    final dioClient = DioClient(buildContext);

    final response = await dioClient.dio
        .get('api/products?where[moq][greater_than]=1&depth=6');
    Paginated<Product>? paginatedProducts =
        Paginated.fromJSON(response.data, (object) {
      dynamic data = object;
      return Product.fromJson(data);
    });

    Response<Paginated<Product>> responseWithPaginatedProducts =
        Response<Paginated<Product>>(
      data: paginatedProducts,
      requestOptions: response.requestOptions,
    );
    if (onComplete != null) {
      onComplete(responseWithPaginatedProducts);
    }
    return responseWithPaginatedProducts;
  } catch (e) {
    rethrow;
  }
}

import 'package:dio/dio.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';
import 'package:que_based_ecom_fe/src/model/product.dart';

class GetAllProductsType {
  final Paginated<Product>? products;
  final Response response;

  GetAllProductsType(this.products, this.response);
}

Future<GetAllProductsType> getAllProducts() async {
  try {
    final dioClient = DioClient();

    final response =
        await dioClient.dio.get<Paginated<Product>>('api/products');

    // if (docs is List) {
    //   // Now check if each element is a Map<String, dynamic>
    //   docs.forEach((item) {
    //     if (item is Map<String, dynamic>) {
    //       productRes.add(item);
    //     }
    //   });
    // } else {
    //   // Handle the case where response.data['docs'] is not a List
    //   print('response.data[\'docs\'] is not a List');
    // }

    return GetAllProductsType(
      response.data,
      response,
    );
  } catch (e) {
    rethrow;
  }
}

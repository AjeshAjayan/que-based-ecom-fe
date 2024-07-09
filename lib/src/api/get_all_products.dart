import 'package:dio/dio.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';
import 'package:que_based_ecom_fe/src/model/product.dart';

class GetAllProductsType {
  final List<Product> products;
  final Response response;

  GetAllProductsType(this.products, this.response);
}

Future<GetAllProductsType> getAllProducts() async {
  try {
    final dioClient = DioClient();
    // TODO: assign proper type to get
    final response = await dioClient.dio.get('api/products');

    dynamic docs =
        response.data['docs']; // Assuming response.data['docs'] is dynamic
    List<Map<String, dynamic>> productRes = [];

    if (docs is List) {
      // Now check if each element is a Map<String, dynamic>
      docs.forEach((item) {
        if (item is Map<String, dynamic>) {
          productRes.add(item);
        }
      });
    } else {
      // Handle the case where response.data['docs'] is not a List
      print('response.data[\'docs\'] is not a List');
    }

    final List<Product> productList = List<Product>.from(
      productRes.map((prod) => Product.fromJSON(prod)),
    );

    return GetAllProductsType(
      productList,
      response,
    );
  } catch (e) {
    rethrow;
  }
}

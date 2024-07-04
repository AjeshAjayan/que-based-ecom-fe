import 'package:dio/dio.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';

Future<Response<dynamic>> verifyOTP(String otp, String phoneNumber) async {
  try {
    final dioClient = DioClient();
    final response = await dioClient.dio.post(
      'api/v1/auth/validateOTP',
      data: {"otp": otp, "phoneNumber": phoneNumber},
    );

    return response;
  } catch (e) {
    rethrow;
  }
}

import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';

Future<dynamic> sendOTP(String phoneNumber, BuildContext buildContext) async {
  final dioClient = DioClient(buildContext);
  final response = await dioClient.dio
      .post('api/v1/auth/sendOTP', data: {"phoneNumber": phoneNumber});
  return response.data;
}

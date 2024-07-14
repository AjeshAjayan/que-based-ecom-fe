import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';

Future<Response<dynamic>> verifyOTP(
    String otp, String phoneNumber, BuildContext buildContext) async {
  try {
    final dioClient = DioClient(buildContext);
    final response = await dioClient.dio.post(
      'api/v1/auth/validateOTP',
      data: {"otp": otp, "phoneNumber": phoneNumber},
    );

    return response;
  } catch (e) {
    rethrow;
  }
}

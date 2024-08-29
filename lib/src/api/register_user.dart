import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';

Future<Response<dynamic>> registerUser(
  BuildContext buildContext, {
  required String phoneNumber,
  required String firstName,
  required String lastName,
  required String dob,
  String? email,
}) async {
  try {
    final dioClient = DioClient(buildContext);
    final response = await dioClient.dio.put('api/v1/register', data: {
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'email': email,
    });

    return response;
  } catch (e) {
    rethrow;
  }
}

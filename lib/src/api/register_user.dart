import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/dio.dart';
import 'package:que_based_ecom_fe/src/model/public_user/public_user.dart';
import 'package:que_based_ecom_fe/src/model/public_user_with_token/public_user_with_token.dart';

Future<Response<PublicUserWithToken>> registerUser(
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
    PublicUser publicUser = PublicUser.fromJson(response.data);
    Response<PublicUserWithToken> responseModified =
        Response<PublicUserWithToken>(
      requestOptions: response.requestOptions,
      data: PublicUserWithToken(
        id: publicUser.id,
        phoneNumber: publicUser.phoneNumber,
        firstName: publicUser.firstName,
        lastName: publicUser.lastName,
        email: publicUser.email,
        otp: publicUser.otp,
        otpExpiry: publicUser.otpExpiry,
        validated: publicUser.validated,
        isBlocked: publicUser.isBlocked,
        reasonForBlock: publicUser.reasonForBlock,
        token: response.data['token'],
      ),
    );
    return responseModified;
  } catch (e) {
    rethrow;
  }
}

import 'package:que_based_ecom_fe/src/model/public_user/public_user.dart';

class PublicUserWithToken extends PublicUser {
  PublicUserWithToken({
    required super.id,
    required super.phoneNumber,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.otp,
    required super.otpExpiry,
    required super.validated,
    required super.isBlocked,
    required super.reasonForBlock,
    required this.token,
  });

  final String token;
}

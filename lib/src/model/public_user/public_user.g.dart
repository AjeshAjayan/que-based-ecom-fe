// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicUser _$PublicUserFromJson(Map<String, dynamic> json) => PublicUser(
      id: json['_id'] as String,
      phoneNumber: (json['phoneNumber'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      otp: json['otp'] as String,
      otpExpiry: json['otpExpiry'] as String,
      validated: json['validated'] as bool,
      isBlocked: json['isBlocked'] as bool,
      reasonForBlock: json['reasonForBlock'] as String,
    );

Map<String, dynamic> _$PublicUserToJson(PublicUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'otp': instance.otp,
      'otpExpiry': instance.otpExpiry,
      'validated': instance.validated,
      'isBlocked': instance.isBlocked,
      'reasonForBlock': instance.reasonForBlock,
    };

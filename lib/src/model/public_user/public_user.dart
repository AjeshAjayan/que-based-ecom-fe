import 'package:json_annotation/json_annotation.dart';

part 'public_user.g.dart';

@JsonSerializable()
class PublicUser {
  @JsonKey(name: '_id')
  final String id;
  final int phoneNumber;
  final String firstName;
  final String lastName;
  final String email;
  final String otp;
  final String otpExpiry;
  final bool validated;
  final bool isBlocked;
  final String reasonForBlock;

  PublicUser({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.otp,
    required this.otpExpiry,
    required this.validated,
    required this.isBlocked,
    required this.reasonForBlock,
  });

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);

  Map<String, dynamic> toJson() => _$PublicUserToJson(this);
}

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class QOtpFields extends StatelessWidget {
  const QOtpFields({super.key, required this.onSubmit});

  final void Function(String) onSubmit;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      borderColor: const Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: onSubmit, // end onSubmit
    );
  }
}

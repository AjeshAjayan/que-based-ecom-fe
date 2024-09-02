import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:que_based_ecom_fe/src/api/verify_otp.dart';
import 'package:que_based_ecom_fe/src/utils/write_token_to_secure_storage.dart';
import 'package:que_based_ecom_fe/src/widgets/q_otp_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  bool isLoading = false;

  void _handleIsLoading(bool isLoadingArg) =>
      setState(() => isLoading = isLoadingArg);

  void _handleEditOnClick(BuildContext context) {
    /**
     * go back to the previous;
     * where user can enter the phone number
     */
    context.pop();
  }

  void _handleOnSubmit(BuildContext context, String otp) {
    /**
     * request OTP verification.
     * goto Registration or Home with respect to the response
     */
    _handleIsLoading(true);
    verifyOTP(otp, widget.phoneNumber, context).then((response) {
      /**
       * save token to secure storage
       * null token will be wrote in case of API error
       */
      writeTokenToSecureStorage(response.data['data']['token']);

      _handleIsLoading(false);
      if (response.statusCode == 200) {
        // Already registered
        context.go('/home');
      } else if (response.statusCode == 201) {
        // OTP verified
        context.go('/register/${widget.phoneNumber}');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.data['data']['message'])));
      }
    }).catchError((error) {
      _handleIsLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.response.data['message'])));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('OTP send to ${widget.phoneNumber}'),
                TextButton.icon(
                  onPressed: () => _handleEditOnClick(context),
                  icon: const Icon(Icons.edit),
                  label: const Text('edit?'),
                ),
              ],
            ),
            QOtpFields(
              onSubmit: (code) => _handleOnSubmit(context, code),
            ),
            isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

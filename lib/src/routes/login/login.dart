import 'package:flutter/material.dart';
import 'package:que_based_ecom_fe/src/api/send_otp.dart';
import 'package:que_based_ecom_fe/src/routes/login/verify_otp.dart';

class LoginRoute extends StatelessWidget {
  LoginRoute({super.key});

  final _formKey = GlobalKey<FormState>();
  final RegExp phoneRegex = RegExp(r'^[6789]\d{9}$');
  final TextEditingController _textEditingController = TextEditingController();

  void _handleLoginPress(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // call login API
      sendOTP(_textEditingController.text).then((response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message']),
          ),
        );
        _gotoVerifyOTP(context);
      });
    }
  }

  void _gotoVerifyOTP(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VerifyOTPRoute(
          phoneNumber: _textEditingController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.9,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      buildCounter: (
                        BuildContext context, {
                        int? currentLength,
                        int? maxLength,
                        bool? isFocused,
                      }) {
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text('Phone Number'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        } else if (!phoneRegex.hasMatch(value)) {
                          return 'Phone Number is invalid';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _handleLoginPress(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

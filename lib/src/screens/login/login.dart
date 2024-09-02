import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:que_based_ecom_fe/src/api/send_otp.dart';
import 'package:que_based_ecom_fe/src/widgets/q_button_primary.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final RegExp phoneRegex = RegExp(r'^[6789]\d{9}$');

  final TextEditingController _textEditingController = TextEditingController();

  bool isLoading = false;

  void _handleIsLoading(bool isLoadingArg) =>
      setState(() => isLoading = isLoadingArg);

  void _handleLoginPress(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _handleIsLoading(true);

      // call login API
      sendOTP(_textEditingController.text, context).then((response) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message']),
          ),
        );
        _handleIsLoading(false);
        _gotoVerifyOTP(context);
      }).catchError((e) {
        _handleIsLoading(false);
      });
    }
  }

  void _gotoVerifyOTP(BuildContext context) {
    context.go('/verify-otp/${_textEditingController.text}');
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
            QButtonPrimary(
              onPressed: () => _handleLoginPress(context),
              icon: const Icon(Icons.login),
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}

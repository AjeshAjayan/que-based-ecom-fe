import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:que_based_ecom_fe/src/api/register_user.dart';
import 'package:que_based_ecom_fe/src/constants.dart';
import 'package:que_based_ecom_fe/src/utils/write_token_to_secure_storage.dart';
import 'package:que_based_ecom_fe/src/widgets/q_button_primary.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  void _handleIsLoading(bool isLoadingArg) =>
      setState(() => isLoading = isLoadingArg);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: getInitialDate(),
      firstDate: getFirstDate(),
      lastDate: getLastDate(),
      helpText: 'When was it!',
    );
    if (date != null) {
      _dateController.text = DateFormat('MM-dd-yyyy').format(date);
      date.toString();
    }
  }

  DateTime getInitialDate() {
    final today = DateTime.now();
    final year18YearsAgo = today.year - 24;
    return DateTime(year18YearsAgo, 6, today.day);
  }

  DateTime getFirstDate() {
    final today = DateTime.now();
    final year18YearsAgo = today.year - 100;
    return DateTime(year18YearsAgo);
  }

  DateTime getLastDate() {
    final today = DateTime.now();
    final year5YearsAgo = today.year - 5;
    return DateTime(year5YearsAgo);
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First Name is required';
    } else if (!nameRegex.hasMatch(value)) {
      return 'Must not include any symbols or numbers';
    }

    return null;
  }

  Future<void> _handleRegistration(BuildContext context) async {
    if (_formState.currentState?.validate() ?? false) {
      _handleIsLoading(true);
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final dateOfBirth = _dateController.text;
      final email = _emailController.text.trim();

      try {
        final response = await registerUser(
          context,
          phoneNumber: widget.phoneNumber,
          email: email,
          firstName: firstName,
          lastName: lastName,
          dob: dateOfBirth,
        );

        if (response.statusCode == 201) {
          // user registered successfully
          writeTokenToSecureStorage(response.data['data']['token'] ?? '');
          if (context.mounted) {
            context.go('/home');
          }
        } else if (response.statusCode == 403) {
          // OTP is not validated - in case if the user by-passed OTP verification
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.data['error']),
              ),
            );
          }
        }
        _handleIsLoading(false);
      } catch (e) {
        _handleIsLoading(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    hintText: 'Steeve',
                    suffixIcon: Icon(Icons.person),
                  ),
                  validator: (String? value) {
                    return _validateName(value);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    hintText: 'Jobs',
                    suffixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (String? value) {
                    return _validateName(value);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date of Birth',
                      hintText: '24-02-1955',
                      suffixIcon: Icon(Icons.cake)),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail (optional)',
                    hintText: 'sjobs@apple.com',
                    suffixIcon: Icon(Icons.mail),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: QButtonPrimary(
                      onPressed: () => _handleRegistration(context),
                      icon: const Icon(Icons.login),
                      label: 'Let\'s go!',
                      loading: isLoading,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

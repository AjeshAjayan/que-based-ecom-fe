import 'package:flutter/material.dart';

class QError extends StatelessWidget {
  final String message;
  final String subMessage;

  const QError({
    super.key,
    required this.message,
    required this.subMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(message)),
            Center(
              child: Text(
                subMessage,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

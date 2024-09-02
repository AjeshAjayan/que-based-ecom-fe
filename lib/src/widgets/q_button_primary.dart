import 'package:flutter/material.dart';

class QButtonPrimary extends StatelessWidget {
  const QButtonPrimary({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.loading,
  });

  final void Function() onPressed;
  final Widget icon;
  final String label;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: loading == null || !(loading ?? false)
          ? icon
          : const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(),
            ),
      label: Text(label),
    );
  }
}

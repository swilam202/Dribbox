import 'package:flutter/material.dart';

import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final Color textColor;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Text(
          text,
          style: StyleManager.smallTextStyle(
            color: textColor,
            fontWeight: FontWeightManager.semiBoldWeight,
            fontSize: 14,
          ),
        ),
        label: Icon(
          icon,
          color: textColor,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}
